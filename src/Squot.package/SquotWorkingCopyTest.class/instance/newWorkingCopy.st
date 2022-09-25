initialize-release
newWorkingCopy
	^ SquotToggles useNewApi
		ifTrue:
			[SquotWorkingCopy2Adapter for: (SquotWorkingCopy2 repository: self newRepository)]
		ifFalse:
			[self newRepository createWorkingCopy
				store: self newStore;
				yourself]
