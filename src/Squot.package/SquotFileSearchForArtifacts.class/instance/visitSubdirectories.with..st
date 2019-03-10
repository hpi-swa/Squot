as yet unclassified
visitSubdirectories: aFileOrDirectory with: anArtifactLocator
	aFileOrDirectory entries
		select: [:each | each isDirectory]
		thenDo: [:each | self visit: each reference with: anArtifactLocator].