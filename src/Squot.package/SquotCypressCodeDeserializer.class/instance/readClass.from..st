Squot deserialization
readClass: aString from: aDirectory
	| className packageDirectory packageName snapshot |
	self initializeCypressReaderToReadClassFrom: aDirectory.
	packageDirectory := aDirectory parent.
	packageName := packageDirectory basename first: packageDirectory basename size - '.package' size.
	className := aString substrings first.
	snapshot := MCSnapshot fromDefinitions: (cypressReader definitions
				select: [:each | (each respondsTo: #className) and: [each className = className]]).
	^ SquotShadowGraph withSingleShadow:
		(SquotClassShadow
			forPackageNamed: packageName
			withSnapshot: snapshot squotWithSortedDefinitions)