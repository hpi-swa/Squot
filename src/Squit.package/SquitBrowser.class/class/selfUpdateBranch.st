accessing
selfUpdateBranch
	^ SelfUpdateBranch ifNil:
		[self initializeSelfUpdate. SelfUpdateBranch]