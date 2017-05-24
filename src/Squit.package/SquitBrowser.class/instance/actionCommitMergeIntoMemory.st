ui menu
actionCommitMergeIntoMemory

	| previouslyLoadedHistorian workingCopy selectedVersion previousAdditionalParents |
	workingCopy := self projectSelection.
	selectedVersion := self commitSelection.
	previouslyLoadedHistorian := workingCopy loadedHistorian.
	previousAdditionalParents := workingCopy additionalParents.
	
	workingCopy
		loadedHistorian: workingCopy lastLoadedHistorian;
		saveNewVersionMessage: '''stash'' commit' interactive: false;
		mergeVersionInteractively: selectedVersion.
	
	workingCopy loadedVersion: selectedVersion.
	
	workingCopy
		loadedHistorian: previouslyLoadedHistorian;
		additionalParents: previousAdditionalParents