private loading
loadMonticelloSnapshot: anMCSnapshot from: anArtifact replacing: aPackageInfoOrClass
	| objectClassName isSingleClass packageDirectory packageName pathElements |
	objectClassName := anArtifact storeInfo at: #objectClassName.
	isSingleClass := objectClassName endsWith: ' class'.
	self assert: ((isSingleClass = (aPackageInfoOrClass isKindOf: ClassDescription)) or: [aPackageInfoOrClass isNil]).
	packageDirectory := (pathElements := anArtifact path splitBy: '/')
		at: (isSingleClass ifTrue: [pathElements size - 1] ifFalse: [pathElements size]).
	packageName := packageDirectory allButLast: '.package' size.
	MCPackageLoader new
		installSnapshot: anMCSnapshot;
		loadWithNameLike: packageName.
	isSingleClass
		ifTrue: [^ (anMCSnapshot definitions detect: [:each | each isClassDefinition])
			actualClass].
	^ PackageInfo named: packageName