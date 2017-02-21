tests
testFiles
	| vmBinaryArtifact snapshot |
	vmBinaryArtifact := (SquotFileArtifact for: FSLocator vmBinary asFileReference)
			path: 'vm';
			yourself.
	snapshot := SquotSnapshot builder
		add: vmBinaryArtifact;
		buildSnapshot.
	imageStore restoreToSnapshot: snapshot.
	self shouldnt: [imageStore objectAt: 'vm'] raise: Error.
	self assert: ((imageStore objectAt: 'vm') isKindOf: SquotFileArtifact).
	self assert: vmBinaryArtifact equals: (imageStore objectAt: 'vm').