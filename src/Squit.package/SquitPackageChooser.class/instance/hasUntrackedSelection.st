accessing
hasUntrackedSelection

	^ self selectionUntracked > 0 and: [self untrackedPackages notEmpty]