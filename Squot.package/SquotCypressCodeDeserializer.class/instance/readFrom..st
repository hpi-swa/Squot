Squot deserialization
readFrom: aFSReference
	| cypressReader loader snapshot |
	cypressReader := MCFileTreeStCypressReaderWithSettableFileUtils on: aFSReference.
	cypressReader fileUtils: fileUtils.
	cypressReader packageDirectory: (aFSReference directories detect: [:each | each basename endsWith: '.package']) pathString.
	loader := MCPackageLoader new.
	snapshot := cypressReader snapshot.
	loader installSnapshot: snapshot.
	loader load.
	((SquotObjectMetadata forObjectAt: aFSReference) objectClassName endsWith: ' class')
		ifTrue: [^ (snapshot definitions detect: [:each | each isClassDefinition]) actualClass].
	^ nil