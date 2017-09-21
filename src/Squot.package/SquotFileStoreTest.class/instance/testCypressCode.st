tests
testCypressCode
	| sampleMethod sampleClass samplePackage definitions methodFile |
	sampleMethod := self class >> self selector.
	sampleClass := sampleMethod methodClass.
	samplePackage := sampleClass package.
	definitions := {sampleClass asClassDefinition.
					sampleMethod methodReference asMethodDefinition}.
	fileStore add: (((MCSnapshot fromDefinitions: definitions)
				asSquotArtifactForPackage: samplePackage)
				path: 'src';
				initializeDefaultStoreInfoFor: samplePackage;
				yourself).
	methodFile := fileStore directory
			resolve: 'src/', samplePackage name, '.package/', 
				sampleClass name, '.class/instance/', sampleMethod selector, '.st'.
	self assert: methodFile exists description: 'method not found'.
	self assert: ((fileStore artifactAt: 'src/', samplePackage name, '.package') 
			packageArtifactDefinitions includesAllOf: definitions)
		description: 'class or method not read correctly'.