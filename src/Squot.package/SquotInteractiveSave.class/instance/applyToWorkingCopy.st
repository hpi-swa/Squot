applying
applyToWorkingCopy
	"Save the new version in the repository."
	^ (self withUnitOfWorkActive:
		[self startUnitOfWork.
		self validate.
		self chooseChanges])
		then: [:aPatch |
			[self patch: aPatch;
				createVersion;
				updateWorkingCopy.
			"resolve with:" self newVersion]
				ensure: [self finishUnitOfWork]]