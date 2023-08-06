update migration
migrateOldArtifactWithoutReferences: aTrackedObjectMetadata
	| path packageName referenceInfo referenceId fragment |
	referenceInfo := OrderedDictionary newFrom:
		{'type' -> 'package'.
		'content-type' -> (self class environment classNamed: (aTrackedObjectMetadata at: #serializer)) contentType}.
	path := aTrackedObjectMetadata at: #path.
	fragment := path allButLast: (#('.package' '.pkg' '') detect: [:each | path endsWith: each]) size.
	packageName := (fragment copyAfterLast: $/) ifEmpty: [fragment].
	packageName ifNotNil:
		[referenceInfo at: 'packageName' put: packageName].
	referenceId := packageName
		ifNotNil: ['package_', packageName]
		ifNil: ['package'].
	aTrackedObjectMetadata at: 'references' put: {referenceId -> referenceInfo}.