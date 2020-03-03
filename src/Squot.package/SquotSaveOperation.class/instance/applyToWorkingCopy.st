applying
applyToWorkingCopy
	"Save the new version in the repository."
	^ self withUnitOfWork:
		[self validate;
			createVersion;
			updateWorkingCopy.
		self newVersion]