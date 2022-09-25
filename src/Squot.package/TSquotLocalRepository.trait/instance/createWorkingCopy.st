Squot repository
createWorkingCopy
	"Answer a new working copy that uses me as its local repository."
	SquotToggles useNewApi ifTrue:
		[^ (self workingCopyClass repository: self)
			activeHistorian: self defaultHistorian;
			yourself].
	^ self workingCopyClass new
		repository: self;
		loadedHistorian: self defaultHistorian;
		yourself