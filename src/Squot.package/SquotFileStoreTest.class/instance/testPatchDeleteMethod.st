tests
testPatchDeleteMethod
	| sampleClass snapshotWithMethod snapshotWithoutMethod methodFile patch |
	sampleClass := self class.
	snapshotWithMethod := SquotSnapshot builder
		add: ((MCSnapshot
				fromDefinitions: {sampleClass asClassDefinition.
					(sampleClass >> self selector) methodReference asMethodDefinition})
				asSquotArtifactForPackage: sampleClass package);
		buildSnapshot.
	fileStore restoreToSnapshot: snapshotWithMethod.
	methodFile := fileStore directory
			resolve: sampleClass package name, '.package/', 
				sampleClass name, '.class/instance/', self selector, '.st'.
	self assert: methodFile exists description: 'method exists'.
	snapshotWithoutMethod := SquotSnapshot builder
		add: ((MCSnapshot
				fromDefinitions: {sampleClass asClassDefinition})
				asSquotArtifactForPackage: sampleClass package);
		buildSnapshot.
	patch := snapshotWithoutMethod patchRelativeToBase: snapshotWithMethod.
	fileStore applyPatch: patch.
	self deny: methodFile exists description: 'method should not exist'.