accessing artifacts
updateArtifact: anArtifactMerge
	| packageMerge directory serializer |
	anArtifactMerge graphMerge hasChanges ifFalse: [^ self].
	self flag: #todo. "Move the check for the presence of changes to a more general place?"
	packageMerge := anArtifactMerge graphMerge mergeOfStartObject.
	packageMerge squotHasChanges ifFalse: [^ self].
	directory := projectRootDirectory resolve: anArtifactMerge path.
	serializer := SquotCypressCodeSerializer new.
	serializer
		initializeFileTreeWritersInPackageDirectory: directory;
		writeMCOperations:
			(packageMerge conflicts collect: [:each | each resolution]),
			packageMerge modifications
		basedOn: packageMerge working definitions.