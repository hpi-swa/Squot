history walking
visitVersion: aVersion
	(seen includes: aVersion internalId) ifTrue: [^self].
	seen add: aVersion internalId.
	(sinkVersions includes: aVersion) ifTrue: [^self].
	searchFrontier addAll: aVersion parents.
	versionBlock
		ifNotNil: [versionBlock value: aVersion]
		ifNil: [versionList add: aVersion].