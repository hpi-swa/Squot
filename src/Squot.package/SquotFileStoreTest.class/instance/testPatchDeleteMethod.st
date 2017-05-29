tests
testPatchDeleteMethod
	| snapshotWithMethod snapshotWithoutMethod methodFile patch |
	snapshotWithMethod := SquotSnapshot builder
		add: (SquotArtifact new
			content: (MCSnapshot
				fromDefinitions: {self class asClassDefinition.
					(self class >> self selector) methodReference asMethodDefinition});
			path: 'src';
			initializeDefaultStoreInfoFor: self class;
			validatePathFor: self class;
			yourself);
		buildSnapshot.
	fileStore restoreToSnapshot: snapshotWithMethod.
	methodFile := fileStore directory
			resolve: 'src/', self class package name, '.package/', 
				self class name, '.class/instance/', self selector, '.st'.
	self assert: methodFile exists description: 'method exists'.
	snapshotWithoutMethod := SquotSnapshot builder
		add: (SquotArtifact new
			content: (MCSnapshot
				fromDefinitions: {self class asClassDefinition});
			path: 'src';
			initializeDefaultStoreInfoFor: self class;
			validatePathFor: self class;
			yourself);
		buildSnapshot.
	patch := snapshotWithoutMethod patchRelativeToBase: snapshotWithMethod.
	fileStore applyPatch: patch.
	self deny: methodFile exists description: 'method should not exist'.