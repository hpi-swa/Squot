setUp
secondMergeParentDefinitionsFor: snapshot

	| packageArtifact previousDefinitions |
	packageArtifact := snapshot artifactAt: packagePath.
	previousDefinitions := packageArtifact packageArtifactDefinitions reject: 
		[:definition | definition isMethodDefinition and: [definition selector = #conflictMethod]].
	^ previousDefinitions , {MCMethodDefinition
		className: sampleClass name
		selector: #thirdMethod
		category: 'methods of third version'
		timeStamp: 'whatever'
		source: (thirdMethodSource := 'thirdMethod ^ self')}