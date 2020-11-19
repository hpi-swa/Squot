applying
applyToWorkingCopy
	"Save the new version in the repository."
	^ self withUnitOfWork:
		[patch ifNil: [patch := self computePatch].
		self validate;
			applyLoadStatusToPatchArtifacts: patch;
			createVersion;
			updateWorkingCopy.
		self newVersion]