applying
applyToWorkingCopy
	"Save the new version in the repository."
	workingCopy hasAdditionalParents ifTrue:
		[self confirmAdditionalParents ifFalse: [^ Promise new rejectWith: #cancelled]].
	^ (self withUnitOfWorkActive:
		[self startUnitOfWork.
		patch ifNil: [patch := self computePatch].
		self validate;
			applyLoadStatusToPatchArtifacts: patch;
			chooseChanges])
		then: [:aPatch |
			[self patch: aPatch;
				createVersion;
				updateWorkingCopy.
			"resolve with:" self newVersion]
				ensure: [self finishUnitOfWork]]