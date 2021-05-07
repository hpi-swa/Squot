utilities
denyChangesInWorkingCopy
	| patch |
	repository withUnitOfWork:
		[patch := workingCopy patchRelativeToBase: workingCopy baseVersion.
		self deny: patch hasChanges].