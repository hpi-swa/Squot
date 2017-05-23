history walking
visitVersion: aVersion
	(seen includes: (self idOf: aVersion)) ifTrue: [^self].
	seen add: (self idOf: aVersion).
	(sinkVersions includes: aVersion) ifTrue: [^self].
	searchFrontier addAll: aVersion parents.
	versionBlock
		ifNotNil: [versionBlock value: aVersion]
		ifNil: [versionList add: aVersion].