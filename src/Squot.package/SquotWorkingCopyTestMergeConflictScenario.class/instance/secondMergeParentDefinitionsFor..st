setUp
secondMergeParentDefinitionsFor: snapshot

	| packageArtifact |
	packageArtifact := snapshot artifactAt: packagePath.
	^ packageArtifact packageArtifactDefinitions , {MCMethodDefinition
		className: sampleClass name
		selector: #conflictMethod
		category: 'conflict methods'
		timeStamp: 'whatever'
		source: ('conflictMethod ^ 2').
	MCMethodDefinition
		className: sampleClass name
		selector: #thirdMethod
		category: 'methods of third version'
		timeStamp: 'whatever'
		source: (thirdMethodSource := 'thirdMethod ^ self')}