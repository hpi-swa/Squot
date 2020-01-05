asserting
assertConflictedMethodWorkingEditionPresentIn: aMerge
	| packageMerge |
	packageMerge := aMerge mergeAt: packagePath.
	testCase
		assert:
			(packageMerge working packageArtifactDefinitions
				anySatisfy: [:each | (each source beginsWith: 'conflictMethod')
							and:  [each source withBlanksTrimmed endsWith: '^ 1']])
		description: ['loaded edition of conflictMethod not on the left side', String cr,
			'found only: ', (packageMerge working packageArtifactDefinitions
				inject: String cr into: [:all :each | all, each source, String cr])].