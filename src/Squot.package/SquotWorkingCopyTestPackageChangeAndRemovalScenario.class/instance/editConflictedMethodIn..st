merging
editConflictedMethodIn: aMerge
	
	| packageMerge conflictNode |
	packageMerge := aMerge mergeAt: packagePath.
	testCase assert:
		(packageMerge base packageArtifactDefinitions
			anySatisfy: [:each | each source beginsWith: 'conflictMethod']).
	conflictNode := packageMerge asDiffTree children first children
		detect: [:each | each title beginsWith: 'conflictMethod']
		ifNone: [testCase fail: 'No tree node for conflictMethod found'].
	conflictNode editTo: (MCMethodDefinition
									className: sampleClass name
									selector: #conflictMethod
									category: 'conflict methods'
									timeStamp: 'whatever'
									source: ('conflictMethod ^ 3')).