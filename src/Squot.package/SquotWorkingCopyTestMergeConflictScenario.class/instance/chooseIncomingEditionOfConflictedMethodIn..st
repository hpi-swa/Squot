merging
chooseIncomingEditionOfConflictedMethodIn: aMerge
	| packageMerge conflictNode |
	packageMerge := aMerge mergeAt: packagePath.
	testCase assert:
		(packageMerge base packageArtifactDefinitions
			noneSatisfy: [:each | each source beginsWith: 'conflictMethod']).
	conflictNode := packageMerge asDiffTree children first children
		detect: [:each | each title beginsWith: 'conflictMethod']
		ifNone: [testCase fail: 'No tree node for conflictMethod found'].
	conflictNode chooseRight.