testing
hasChanges
	^ diffs isEmpty not and: [diffs anySatisfy: #hasChanges]