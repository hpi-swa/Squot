as yet unclassified
sampleArtifact
	| sampleMethod definitions |
	sampleMethod := self class >> self selector.
	sampleClass := sampleMethod methodClass.
	samplePackage := sampleClass package.
	definitions := {sampleClass asClassDefinition.
					sampleMethod methodReference asMethodDefinition.
					MCOrganizationDefinition categories: (Array with: sampleClass category)}.
	^ (((MCSnapshot fromDefinitions: definitions)
			asSquotArtifactForPackage: samplePackage)
			path: (sampleArtifactPath := 'src/', samplePackage name);
			initializeDefaultStoreInfoFor: samplePackage;
			yourself)