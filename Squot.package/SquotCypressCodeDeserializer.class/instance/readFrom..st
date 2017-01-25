Squot deserialization
readFrom: aFSReference
	| metadata classOfStoredObject isClass cypressReader packageDirectory packageName loader snapshot |
	metadata := SquotObjectMetadata forObjectAt: aFSReference.
	classOfStoredObject := metadata objectClassName.
	isClass := classOfStoredObject endsWith: ' class'.
	cypressReader := MCFileTreeStCypressReaderWithSettableFileUtils on: aFSReference.
	cypressReader fileUtils: fileUtils.
	packageDirectory := isClass ifTrue: [aFSReference parent] ifFalse: [aFSReference].
	packageName := packageDirectory basename first: packageDirectory basename size - '.package' size.
	cypressReader packageDirectory: packageDirectory pathString.
	loader := MCPackageLoader new.
	snapshot := isClass
		ifFalse: [cypressReader snapshot]
		ifTrue: [ | className | className := classOfStoredObject substrings first.
			MCSnapshot fromDefinitions: (cypressReader definitions
				select: [:each | (each respondsTo: #className) and: [each className = className]])].
	loader installSnapshot: snapshot.
	loader loadWithNameLike: packageName.
	isClass
		ifTrue: [^ (snapshot definitions detect: [:each | each isClassDefinition]) actualClass].
	^ PackageInfo named: packageName