asserting
assertConflictedMethodIncomingEditionPresentIn: aMerge
	| packageMerge |
	packageMerge := aMerge mergeAt: packagePath.
	testCase
		assert:
			((aMerge incoming packageDefinitionsOfArtifact: packageMerge incoming)
				anySatisfy: [:each | (each source beginsWith: 'conflictMethod')
							and:  [each source withBlanksTrimmed endsWith: '^ 2']])
		description: ['remote edition of conflictMethod not on the right side', String cr,
			'found only: ', ((aMerge working packageDefinitionsOfArtifact: packageMerge working)
				inject: String cr into: [:all :each | all, each source, String cr])].