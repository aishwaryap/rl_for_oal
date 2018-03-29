import itertools


def evaluate_net(net, num_hidden_units, inputs):
    o = net['u']
    for i in range(num_hidden_units):
        h = net['w_0' + str(i)] + net['w_1' + str(i)] * inputs['f_1'] + \
            net['w_2' + str(i)] * inputs['f_2'] + net['w_3' + str(i)] * inputs['f_3']
        o += net['v_' + str(i)] * h
    return o


def main():
    num_hidden_units = 10

    var_names = ['u'] + ['v_' + str(i) for i in range(num_hidden_units)]
    for i in range(num_hidden_units):
        var_names += ['w_0' + str(i), 'w_1' + str(i), 'w_2' + str(i), 'w_3' + str(i)]

    assignments = list(itertools.product([0, 1], repeat=len(var_names)))

    num_assignments_tried = 0
    for assignment in assignments:
        net = dict(zip(var_names, list(assignment)))
        o_010 = evaluate_net(net, num_hidden_units, {'f_1': 0, 'f_2': 1, 'f_3': 0})
        o_100 = evaluate_net(net, num_hidden_units, {'f_1': 1, 'f_2': 0, 'f_3': 0})
        o_011 = evaluate_net(net, num_hidden_units, {'f_1': 0, 'f_2': 1, 'f_3': 1})
        o_101 = evaluate_net(net, num_hidden_units, {'f_1': 1, 'f_2': 0, 'f_3': 1})
        if o_010 == 0 and o_100 == 1 and o_011 == 1 and o_101 == 0:
            print '\n'.join([key + ': ' + str(value) for (key, value) in net.items()])
            break
        num_assignments_tried += 1
        if num_assignments_tried % 100000 == 0:
            print num_assignments_tried, 'assignments tried'


if __name__ == '__main__':
    main()



