Squot repository
createWorkingCopy
	"Answer a new working copy that uses me as its local repository."
	^ self workingCopyClass new
		repository: self;
		loadedHistorian: self defaultHistorian;
		yourself