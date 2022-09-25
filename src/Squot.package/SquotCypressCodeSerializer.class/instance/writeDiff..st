Squot serialization
writeDiff: aSquotArtifactDiff
	| directory |
	aSquotArtifactDiff isAddition ifTrue: [^ self write: aSquotArtifactDiff right].
	aSquotArtifactDiff isRemoval ifTrue: [^ self notYetImplemented].
	self assert: aSquotArtifactDiff isModification.
	aSquotArtifactDiff content squotHasChanges ifFalse: [^ self "nothing to do"].
	directory := ((aSquotArtifactDiff right storeInfo at: #objectClassName ifAbsent: [#PackageInfo]) endsWith: ' class')
		ifTrue: [(rootDirectory resolve: aSquotArtifactDiff path) parent]
		ifFalse: [rootDirectory resolve: aSquotArtifactDiff path].
	self initializeFileTreeWritersInPackageDirectory: directory.
	self writeMCOperations: aSquotArtifactDiff content startDiff patch operations
		basedOn: aSquotArtifactDiff content startDiff working definitions.