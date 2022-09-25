Squot deserialization
readPackageFrom: aDirectory
	| packageName snapshot |
	self initializeCypressReaderToReadPackageFrom: aDirectory.
	packageName := aDirectory basename first: aDirectory basename size - '.package' size.
	snapshot := cypressReader snapshot.
	^ SquotShadowGraph withSingleShadow:
		(SquotPackageShadow
			forPackageNamed: packageName
			withSnapshot: snapshot squotWithSortedDefinitions).