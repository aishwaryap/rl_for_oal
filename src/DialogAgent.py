#!/usr/bin/python
# Functions useful to all dialog agents


__author__ = 'aishwarya'


class DialogAgent:
    def __init__(self, file_manager, classifier_manager):
        self.file_manager = file_manager
        self.classifier_manager = classifier_manager

        self.seen_predicates = list()               # All predicates the agent has ever seen
        self.predicates_with_classifiers = list()   # All predicates for which a classifier has been fitted

        # Fields to maintain dialog state
        self.candidate_regions = None       # Regions under discussion
        self.description = None             # Description to understand
        self.current_predicates = None      # Labels relevant to understanding current description
        self.num_system_turns = None

        # Caching things useful within a dialog
        self.candidate_region_features = None   # Features of candidate regions
        self.region_contents = None             # Objects and attributes in candidate regions

        # Labels acquired (within dialog)
        # This is a dict with label name as key, and (region_id, label value (0/1)) as value
        self.labels_acquired = dict()

    # Load things that are required at start of an interaction
    # candidate_regions - List of region IDs (int) of candidate regions
    # description - Normalized string description of region
    def setup_task(self, candidate_regions, description):
        self.candidate_regions = candidate_regions
        self.description = description
        self.num_system_turns = 0

        # We can just tokenize to get predicates because descriptions have been preprocessed for stemming
        # and removing stopwords
        self.current_predicates = self.description.split('_')
        self.seen_predicates += self.current_predicates

        self.candidate_region_features = self.file_manager.get_region_features(self.candidate_regions)
        self.region_contents = self.file_manager.get_region_contents(self.candidate_regions)

    def finish_task(self):
        # Precautions to make sure these get reset
        self.candidate_regions = None
        self.description = None
        self.current_predicates = None
        self.num_system_turns = None
        self.candidate_region_features = None
        self.region_contents = None





