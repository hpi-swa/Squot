merging
chooseIncomingEditionOfConflictedMethodIn: aMerge
	| packageMerge conflictNode |
	packageMerge := aMerge mergeAt: packagePath.
	testCase assert:
		((aMerge base packageDefinitionsOfArtifact: packageMerge base)
			noneSatisfy: [:each | each source beginsWith: 'conflictMethod']).
	conflictNode := packageMerge asDiffTree children first children
		detect: [:each | each title beginsWith: 'conflictMethod']
		ifNone: [testCase fail: 'No tree node for conflictMethod found'].
	conflictNode chooseRight.