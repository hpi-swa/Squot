ui menu
actionCommitMergeIntoMemory

	| previouslyLoadedHistorian workingCopy previousAdditionalParents |
	workingCopy := self projectSelection.
	previouslyLoadedHistorian := workingCopy loadedHistorian.
	previousAdditionalParents := workingCopy additionalParents.
	
	workingCopy
		loadedHistorian: workingCopy lastLoadedHistorian;
		saveNewVersionMessage: '''stash'' commit' interactive: false;
		mergeVersionInteractively: self commitSelection.
	
	workingCopy lastLoadedHistorian version: previouslyLoadedHistorian version.
	
	workingCopy
		loadedHistorian: previouslyLoadedHistorian;
		additionalParents: previousAdditionalParents