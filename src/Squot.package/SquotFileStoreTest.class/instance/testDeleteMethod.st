tests
testDeleteMethod
	| sampleMethod sampleClass snapshotWithMethod snapshotWithoutMethod methodFile |
	sampleMethod := self class >> self selector.
	sampleClass := sampleMethod methodClass.
	snapshotWithMethod := SquotSnapshot builder
		add: (((MCSnapshot
				fromDefinitions: {sampleClass asClassDefinition.
					sampleMethod methodReference asMethodDefinition})
				asSquotArtifactForPackage: sampleClass package)
				path: 'src/', sampleClass package name, '.package';
				initializeDefaultStoreInfoFor: sampleClass package;
				yourself);
		buildSnapshot.
	fileStore restoreToSnapshot: snapshotWithMethod.
	methodFile := fileStore directory
			resolve: 'src/', sampleClass package name, '.package/', 
				sampleClass name, '.class/instance/', sampleMethod selector, '.st'.
	self assert: methodFile exists description: 'method file not created by restoreToSnapshot'.
	snapshotWithoutMethod := SquotSnapshot builder
		add: (snapshotWithMethod artifacts anyOne copyWithDifferentContent:
				((MCSnapshot
					fromDefinitions: {sampleClass asClassDefinition})
					asSquotArtifactForPackage: sampleClass package) content);
		buildSnapshot.
	fileStore restoreToSnapshot: snapshotWithoutMethod.
	self deny: methodFile exists description: 'method should not exist'.