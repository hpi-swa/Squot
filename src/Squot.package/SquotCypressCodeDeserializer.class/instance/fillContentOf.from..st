Squot deserialization
fillContentOf: anArtifact from: aDirectory
	| classOfStoredObject isClass cypressReader packageDirectory packageName snapshot |
	classOfStoredObject := anArtifact storeInfo at: #objectClassName.
	isClass := classOfStoredObject endsWith: ' class'.
	cypressReader := MCFileTreeStCypressReaderWithSettableFileUtils on: aDirectory.
	cypressReader fileUtils: fileUtils.
	fileUtils directory: aDirectory.
	packageDirectory := isClass ifTrue: [aDirectory parent] ifFalse: [aDirectory].
	packageName := packageDirectory basename first: packageDirectory basename size - '.package' size.
	cypressReader packageDirectory: packageDirectory pathString.
	snapshot := isClass
		ifFalse: [cypressReader snapshot]
		ifTrue: [ | className | className := classOfStoredObject substrings first.
			MCSnapshot fromDefinitions: (cypressReader definitions
				select: [:each | (each respondsTo: #className) and: [each className = className]])].
	anArtifact content: snapshot squotWithSortedDefinitions.