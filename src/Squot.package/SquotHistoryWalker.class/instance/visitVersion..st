history walking
visitVersion: aVersion
	(seen includes: aVersion internalId) ifTrue: [^self].
	seen add: aVersion internalId.
	(sinkVersions includes: aVersion) ifTrue: [^self].
	versionBlock
		ifNotNil: [versionBlock value: aVersion]
		ifNil: [versionList add: aVersion].
	searchFrontier addAll: aVersion parents.