actions on branches
mergeBranch: aHistorian into: aWorkingCopy
	| mergeHeadCommit |
	mergeHeadCommit := aHistorian version.
	self mergeCommit: mergeHeadCommit
		into: aWorkingCopy
		mergeTitle:  'Merge branch ', aHistorian shortName
		saveTitle: 'Save the merge of ', aHistorian shortName
		saveMessageTemplate: (aHistorian messageWhenMergingInto: aWorkingCopy loadedHistorian).