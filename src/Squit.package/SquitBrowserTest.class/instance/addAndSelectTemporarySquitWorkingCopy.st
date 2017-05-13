as yet unclassified
addAndSelectTemporarySquitWorkingCopy
	SquitTestWorkingCopy current create.
	SquitTestWorkingCopy current instance in: [:workingCopy |
		workingCopy repository: self newRepository.
		workingCopy loadedHistorian: (workingCopy repository defaultHistorian).
		browser projectIndex: (browser projectList indexOf: workingCopy).
		^ workingCopy]