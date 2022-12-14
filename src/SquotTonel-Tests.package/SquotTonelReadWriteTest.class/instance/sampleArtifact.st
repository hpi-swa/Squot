test data
sampleArtifact
	| sampleMethod definitions |
	(sampleClass isNil or: [sampleClass isObsolete]) ifTrue:
		[sampleClass := classFactory newClass.
		sampleClass compile: 'a ^ #a' classified: 'constants' withStamp: 'jr 12/4/2020 20:39' notifying: nil.
		sampleClass classComment: 'This is a test class' stamp: 'jr 12/4/2020 20:39'].
	sampleMethod := sampleClass >> #a.
	samplePackage := PackageInfo named: sampleClass category.
	definitions := {sampleClass asClassDefinition.
					sampleMethod methodReference asMethodDefinition.
					MCOrganizationDefinition categories: (Array with: sampleClass category)}.
	^ (((MCSnapshot fromDefinitions: definitions)
			asSquotArtifactForPackage: samplePackage)
			path: (sampleArtifactPath := 'src/', samplePackage name);
			initializeDefaultStoreInfoFor: samplePackage;
			yourself)