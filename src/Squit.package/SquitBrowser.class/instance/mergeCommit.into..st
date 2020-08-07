actions on versions
mergeCommit: aVersion into: aWorkingCopy
	self mergeCommit: aVersion
		into: aWorkingCopy
		mergeTitle: 'Merge ', aVersion
		saveTitle:  'Save the merge of ', aVersion
		saveMessageTemplate: ('Merge commit ', aVersion internalId, ' into ', aWorkingCopy loadedHistorian shortName).