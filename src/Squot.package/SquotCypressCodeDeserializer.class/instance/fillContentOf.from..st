Squot deserialization
fillContentOf: anArtifact from: aDirectory
	| classOfStoredObject isClass packageDirectory packageName snapshot |
	self flag: 'magic constant PackageInfo'.
	classOfStoredObject := anArtifact storeInfo at: #objectClassName ifAbsent: ['PackageInfo'].
	isClass := classOfStoredObject endsWith: ' class'.
	isClass
		ifTrue: [self initializeCypressReaderToReadClassFrom: aDirectory]
		ifFalse: [self initializeCypressReaderToReadPackageFrom: aDirectory].
	packageDirectory := isClass ifTrue: [aDirectory parent] ifFalse: [aDirectory].
	packageName := packageDirectory basename first: packageDirectory basename size - '.package' size.
	snapshot := isClass
		ifFalse: [cypressReader snapshot]
		ifTrue: [ | className | className := classOfStoredObject substrings first.
			MCSnapshot fromDefinitions: (cypressReader definitions
				select: [:each | (each respondsTo: #className) and: [each className = className]])].
	anArtifact content: (SquotShadowGraph withSingleShadow:
		((isClass ifTrue: [SquotClassShadow] ifFalse: [SquotPackageShadow])
			forPackageNamed: packageName
			withSnapshot: snapshot squotWithSortedDefinitions)).