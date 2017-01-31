visiting
visitFile: aFileReference
	(ignoredPaths includes: aFileReference path) ifTrue: [^ self].
	snapshotBuilder add: ((SquotFileArtifact for: aFileReference)
		path: (fileStore pathOf: aFileReference);
		yourself).