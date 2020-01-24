applying
applyToWorkingCopy
	"Save the new version in the repository."
	self validate;
		createVersion;
		updateWorkingCopy.
	^ self newVersion