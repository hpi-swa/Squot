asserting
assertConflictedMethodIncomingEditionPresentIn: aMerge
	| packageMerge |
	packageMerge := aMerge mergeAt: packagePath.
	testCase
		assert:
			(packageMerge incoming packageArtifactDefinitions
				anySatisfy: [:each | (each source beginsWith: 'conflictMethod')
							and:  [each source withBlanksTrimmed endsWith: '^ 2']])
		description: ['remote edition of conflictMethod not on the right side', String cr,
			'found only: ', (packageMerge working packageArtifactDefinitions
				inject: String cr into: [:all :each | all, each source, String cr])].