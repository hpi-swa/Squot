tests
testMergeWithConflicts
	| scenario |
	self suppressChangeNotificationsDuring:
	[scenario := SquotWorkingCopyTestMergeConflictScenario forTestCase: self.
	"merge the version of the other historian"
	[[scenario merge]
	on: SquotMergeRequested do: [:request | | packageDiff conflictNode |
		"make sure the second and third method edition are in the patch"
		packageDiff := request merge diffAt: scenario packagePath.
		self assert: (packageDiff left packageArtifactDefinitions
				anySatisfy: [:each | (each source beginsWith: 'conflictMethod')
							and:  [each source withBlanksTrimmed endsWith: '^ 1']])
			description: ['loaded edition of conflictMethod not on the left side', String cr,
				'found only: ', (packageDiff left packageArtifactDefinitions
					inject: String cr into: [:all :each | all, each source, String cr])].
		"the second method should be there as well"
		self assert: (packageDiff right packageArtifactDefinitions
				anySatisfy: [:each | (each source beginsWith: 'conflictMethod')
							and: [each source withBlanksTrimmed endsWith: '^ 2']])
			description: ['remote edition of conflictMethod not on the right side', String cr,
				'found only: ', (packageDiff right packageArtifactDefinitions
					inject: String cr into: [:all :each | all, each source, String cr])].
		"resolve conflict"
		self assert: (packageDiff base packageArtifactDefinitions
			noneSatisfy: [:each | each source beginsWith: 'conflictMethod']).
		conflictNode := packageDiff asDiffTree children first children first.
		self assert: (conflictNode title beginsWith: 'conflictMethod').
		conflictNode chooseLeft.
		request setHandled]
	] valueSupplyingAnswers: {{'*'. #default}}].
	scenario assertConflictMethodHasNotChanged: self.
	self assert: scenario secondVersion equals: workingCopy loadedVersion.