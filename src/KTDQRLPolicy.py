#!/usr/bin/python
#
# Implementation fo the KTD-Q algorithm with the same interface as scikit learn regressors
#       Geist, M. & Pietquin, O. (2010), "Kalman Temporal Differences",
#       Journal of Artificial Intelligence Research (JAIR)., October,
#       2010, Vol. 39, pp. 483-532.
# Variable names imitate the paper but drop superscripts and subscripts
# when unnecessary for the sake of readibility
#
# Implementation has been done using numpy for increased readability and
# in the hope that it scales better. I use numpy matrices not arrays in this
# because arrays don't do vector math in an intuitive way

import numpy as np
import sys
import pickle
from argparse import ArgumentParser
from ParallelRLPolicy import ParallelRLPolicy

__author__ = 'aishwarya'


class KTDQRLPolicy(ParallelRLPolicy):
    def __init__(self, save_file, on_topic, classifier_manager, separate_guess_predictor, candidate_questions_beam_size,
                 min_prob_weight, max_prob_weight, max_prob_kappa, initial_guess_predictor, ablate_feature,
                 init_theta_std_dev, lambda_, eta, P_n, kappa, gamma, cleaning_epsilon, alpha, beta,
                 ablate_feature_group):
        super(KTDQRLPolicy, self).__init__(save_file, on_topic, classifier_manager, 'linear',
                                           separate_guess_predictor, gamma, candidate_questions_beam_size,
                                           min_prob_weight, max_prob_weight, max_prob_kappa, initial_guess_predictor,
                                           ablate_feature, ablate_feature_group)
        if separate_guess_predictor:
            if ablate_feature is None:
                self.n = 13
            else:
                self.n = 12
        else:
            if ablate_feature is None:
                self.n = 25
            else:
                self.n = 24

        # Initialize params
        mu = 0
        sigma = init_theta_std_dev
        self.theta = np.matrix(np.random.normal(mu, sigma, self.n)).T
        self.P = lambda_ * np.matrix(np.eye(self.n))

        # Hyperparameters
        self.eta = eta
        self.P_n = P_n
        self.kappa = kappa
        self.gamma = gamma

        self.cleaning_epsilon = cleaning_epsilon
        self.alpha = alpha
        self.beta = beta

    def get_q(self, dialog_state, action):
        features = super(KTDQRLPolicy, self).get_features(dialog_state, action)
        f = np.matrix(features).T
        return (f.T * self.theta).item(0, 0)

    # A util to get a zero vector because the command is non-intuitive
    def get_zero_vector(self, size):
        return np.matrix(np.zeros(size)).T

    def get_features(self, dialog_state, action):
        super_feature_vector = super(KTDQRLPolicy, self).get_features(dialog_state, action)
        return np.matrix(super_feature_vector).T

    def compute_sigma_points(self):
        theta = list()
        w = list()

        ktdq_lambda = (self.alpha ** 2) * (self.n + self.kappa) - self.n

        matrix_to_decompose = (self.n + ktdq_lambda) * self.P
        # print 'matrix_to_decompose = ', matrix_to_decompose
        # self.check_covariance_matrix(matrix_to_decompose)
        cholesky_decomposition = np.linalg.cholesky(matrix_to_decompose)

        for j in range(0, 2 * self.n + 1):
            if j == 0:
                theta_j = self.theta
                # w_j = self.kappa / (self.n + self.kappa)
                # w_j = (w_j / (self.alpha * self.alpha)) + (1.0 / (self.alpha * self.alpha)) - 1
                w_j = ktdq_lambda / self.n + ktdq_lambda
            elif j <= self.n:
                # Add j^th column of cholesky decomposition
                theta_j = self.theta + cholesky_decomposition[:, j - 1]
                # w_j = 1.0 / (self.n + self.kappa)
                # w_j = (w_j / (self.alpha * self.alpha))
                w_j = 1.0 / 2 * (self.n + ktdq_lambda)
            else:
                # Subtract (j-n)^th column of cholesky decomposition
                theta_j = self.theta - cholesky_decomposition[:, j - self.n - 1]
                # w_j = 1.0 / 2 * (self.n + self.kappa)
                # w_j = (w_j / (self.alpha * self.alpha))
                w_j = 1.0 / 2 * (self.n + ktdq_lambda)

            # theta_j = self.theta + self.alpha * (theta_j - self.theta)

            theta.append(theta_j)
            w.append(w_j)

            # a = np.random.multivariate_normal(np.array(self.theta.flatten()).flatten(), self.P)
            # theta.append(np.matrix(np.reshape(a, (a.size, 1))))
            # w.append(1)
        return theta, w

    def compute_update(self, prev_dialog_state, next_action, next_dialog_state, reward):
        update = dict()

        # Prediction step
        P_v = self.eta * self.P
        update['P_v'] = P_v

        # Calculate sigma points - thetas, weights - w for unscented transform
        # Calculate statistics at the same time
        r_hat = 0
        P_theta_r = self.get_zero_vector(self.n)
        P_r = self.P_n
        (theta, w) = self.compute_sigma_points()
        for j in range(0, 2 * self.n + 1):
            f = self.get_features(prev_dialog_state, next_action)
            r_j = (f.T * theta[j]).item(0, 0)

            if next_dialog_state is not None:
                # If it is a non-terminal state account for future rewards
                max_q = -sys.maxint
                for action in self.get_candidate_actions(next_dialog_state):
                    f = self.get_features(next_dialog_state, action)
                    q = (f.T * theta[j]).item(0, 0)
                    if q > max_q:
                        max_q = q
                f = self.get_features(prev_dialog_state, next_action)
                r_j = r_j - self.gamma * max_q

            r_hat = r_hat + r_j * w[j]

            if j == 0:
                P_r = P_r + (w[j] + 1 - (self.alpha ** 2) + self.beta) * (r_j - r_hat) * (r_j - r_hat)
                P_theta_r = P_theta_r + ((w[j] + 1 - (self.alpha ** 2) + self.beta) * (r_j - r_hat)) * (
                    theta[j] - self.theta)
            else:
                P_r = P_r + w[j] * (r_j - r_hat) * (r_j - r_hat)
                P_theta_r = P_theta_r + (w[j] * (r_j - r_hat)) * (theta[j] - self.theta)

        # Correction step
        K = (1.0 / P_r) * P_theta_r
        update['theta_update'] = K * (reward - r_hat)
        update['P_update'] = P_r * (K * K.T)

    def perform_updates(self, updates):
        for update in updates:
            self.P = self.P + update['P_v']
            self.theta = self.theta + update['theta_update']
            self.P = self.P - update['P_update']


if __name__ == '__main__':
    # Instantiates a static policy and saves it as a pickle
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--model-type', type=str, required=True,
                            help='"mlp" or "linear"')
    arg_parser.add_argument('--separate-guess-predictor', action="store_true", default=False,
                            help='Add this flag if a separate guess predictor is present')
    arg_parser.add_argument('--guess-predictor-file', type=str, default=None,
                            help='File with pickled guess predictor')
    arg_parser.add_argument('--gamma', type=float, default=0.9,
                            help='Gamma for Q learning update')
    arg_parser.add_argument('--candidate-questions-beam-size', type=int, default=None,
                            help='Add this argument to limit number of questions considered to some integer')
    arg_parser.add_argument('--on-topic', action="store_true", default=False,
                            help='Ask only on topic questions')
    arg_parser.add_argument('--min-prob-weight', type=float, default=1.0,
                            help='Probability for kappa=0 and kappa=1')
    arg_parser.add_argument('--max-prob-weight', type=float, default=100.0,
                            help='Probability for peak point')
    arg_parser.add_argument('--max-prob-kappa', type=float, default=0.8,
                            help='Kappa at which distribution peaks')
    arg_parser.add_argument('--ablate-feature', type=int, default=None,
                            help='Ablate this feature idx')
    arg_parser.add_argument('--ablate-feature-group', type=str, default=None,
                            help='query or guess')
    arg_parser.add_argument('--save-file', type=str, required=True,
                            help='File to save pickled policy')

    # KTD-Q Hyperparameters
    arg_parser.add_argument('--init-theta-std-dev', type=float, default=0.01,
                            help='See KTD-Q paper')
    arg_parser.add_argument('--lambda_', type=float, default=1.0,
                            help='See KTD-Q paper')
    arg_parser.add_argument('--eta', type=float, default=0.0,
                            help='See KTD-Q paper')
    arg_parser.add_argument('--P_n', type=float, default=1.0,
                            help='See KTD-Q paper')
    arg_parser.add_argument('--kappa', type=float, default=0.0,
                            help='See KTD-Q paper')
    arg_parser.add_argument('--cleaning-epsilon', type=float, default=0.01,
                            help='See KTD-Q paper')
    arg_parser.add_argument('--alpha', type=float, default=0.001,
                            help='See KTD-Q paper')
    arg_parser.add_argument('--beta', type=float, default=2.0,
                            help='See KTD-Q paper')

    args = arg_parser.parse_args()

    initial_guess_predictor = None
    if args.guess_predictor_file is not None:
        with open(args.guess_predictor_file, 'rb') as handle:
            initial_guess_predictor = pickle.load(handle)

    policy = KTDQRLPolicy(args.save_file, args.on_topic, None, args.separate_guess_predictor,
                          args.candidate_questions_beam_size, args.min_prob_weight, args.max_prob_weight,
                          args.max_prob_kappa, initial_guess_predictor, args.ablate_feature, args.init_theta_std_dev,
                          args.lambda_, args.eta, args.P_n, args.kappa, args.gamma, args.cleaning_epsilon,
                          args.alpha, args.beta, args.ablate_feature_group)
    policy.save()
