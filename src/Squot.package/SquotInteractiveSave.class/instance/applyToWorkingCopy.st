applying
applyToWorkingCopy
	"Save the new version in the repository."
	self validate.
	^ self chooseChanges
		then: [:patch |
			self patch: patch;
				createVersion;
				updateWorkingCopy.
			"resolve with:" self newVersion]