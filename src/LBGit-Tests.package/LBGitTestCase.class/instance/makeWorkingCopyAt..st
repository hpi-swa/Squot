running
makeWorkingCopyAt: aReference

	| repository |
	repository := SquitRepository new initializeInDirectory: aReference.
	^ SquotWorkingCopy newOnObjectMemory
		name: 'LBGitTestWorkingCopy';
		store: SquotImageStore new;
		repository: repository;
		loadedHistorian: (repository historianNamed: 'master').