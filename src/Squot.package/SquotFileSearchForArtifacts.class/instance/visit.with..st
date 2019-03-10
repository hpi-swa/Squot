as yet unclassified
visit: aFileOrDirectory with: anArtifactLocator
	(searchFrontier
		detect: [:each | each key = aFileOrDirectory]
		ifNone: [searchFrontier addLast: aFileOrDirectory -> OrderedCollection new])
		value add: anArtifactLocator.