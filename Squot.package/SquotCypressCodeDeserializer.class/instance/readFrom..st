Squot deserialization
readFrom: aFSReference
	| cypressReader packageDirectory packageName loader snapshot |
	cypressReader := MCFileTreeStCypressReaderWithSettableFileUtils on: aFSReference.
	cypressReader fileUtils: fileUtils.
	packageDirectory := aFSReference directories detect: [:each | each basename endsWith: '.package'].
	packageName := packageDirectory basename first: packageDirectory basename size - '.package' size.
	cypressReader packageDirectory: packageDirectory pathString.
	loader := MCPackageLoader new.
	snapshot := cypressReader snapshot.
	loader installSnapshot: snapshot.
	loader loadWithNameLike: packageName.
	((SquotObjectMetadata forObjectAt: aFSReference) objectClassName endsWith: ' class')
		ifTrue: [^ (snapshot definitions detect: [:each | each isClassDefinition]) actualClass].
	^ PackageInfo named: packageName