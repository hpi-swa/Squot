tests caching
testBaseSnapshotEqualsBaseVersionSnapshot
	| object version baseSnapshot |
	object := ValueHolder new contents: 42.
	repository withUnitOfWork:
		[workingCopy add: object at: 'my object'.
		version := workingCopy saveVersionWithMessage: 'Add object'.
		baseSnapshot := workingCopy baseSnapshot.
		self assert: version equals: workingCopy baseVersion;
			assert: workingCopy baseVersion equals: workingCopy loadedVersion;
			deny: (baseSnapshot patchRelativeToBase: version snapshot) hasChanges;
			denyChangesInWorkingCopy].
	object contents: 13.
	repository withUnitOfWork:
		[version := workingCopy saveVersionWithMessage: 'Update object'.
		baseSnapshot := workingCopy baseSnapshot.
		self assert: version equals: workingCopy baseVersion;
			assert: workingCopy baseVersion equals: workingCopy loadedVersion;
			deny: (baseSnapshot patchRelativeToBase: version snapshot) hasChanges;
			denyChangesInWorkingCopy].