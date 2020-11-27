test objects
workingCopySavePatch
	| patch version |
	version := workingCopy parentVersions first.
	patch := workingCopy newSaveOperation
				message: 'temporary save';
				applyToWorkingCopy;
				patch.
	"Then reset to the previous version, only needed the patch."
	workingCopy loadedVersion: version.
	workingCopy loadedHistorian version: version.
	self assert: version equals: workingCopy parentVersions first.
	^ patch