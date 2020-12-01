utilities
denyChangesInWorkingCopy
	repository withUnitOfWork:
		[self deny: (workingCopy patchRelativeToBase: workingCopy baseVersion) hasChanges].