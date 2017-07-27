tests
testMergeWithConflicts
	| sampleClass packagePath firstVersion secondMethodSource secondVersion  thirdMethodSource thirdVersion otherHistorian packageInfo |
	"create a base version"
	classFactory cleanUp.
	sampleClass := classFactory newClass.
	sampleClass compile: 'firstMethod ^ self' classified: 'methods of first version'.
	packageInfo := PackageInfo named: classFactory packageName.
	workingCopy add: packageInfo at: 'src'.
	packagePath := (workingCopy store pathsOf: packageInfo) anyOne.
	workingCopy saveNewVersionMessage: 'first version' interactive: false.
	firstVersion := workingCopy baseVersion.
	"create first merge parent"
	sampleClass compile: (secondMethodSource := 'conflictMethod ^ 1') classified: 'conflict methods'.
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	secondVersion := workingCopy baseVersion.
	"create second merge parent"
	firstVersion snapshot in: [:firstSnapshot | | packageArtifact newSnapshot |
		packageArtifact := firstSnapshot artifactAt: packagePath.
		newSnapshot := firstSnapshot createNewBuilder
			add: (packageArtifact copyWithDifferentContent:
				((MCSnapshot fromDefinitions:
					(packageArtifact packageArtifactDefinitions,
					{MCMethodDefinition className: sampleClass name
						selector: #conflictMethod category: 'conflict methods'
						timeStamp: 'whatever'
						source: (thirdMethodSource := 'conflictMethod ^ 2')}))
					asSquotArtifactForPackage: packageInfo) content);
			buildSnapshot.
		otherHistorian := repository historianNamed: 'other'.
		otherHistorian version: firstVersion.
		thirdVersion := otherHistorian createNewVersion: newSnapshot
			with: [:newVersion | newVersion message: 'third version']].
	"merge the version of the other historian"
	[[workingCopy
		mergeVersionInteractively: thirdVersion
		ifCanceled: [self fail: 'this code should not be reached']]
		on: SquotSelectionOfChangesRequested do: [:request | | packageDiff conflictNode |
			"make sure the second and third method edition are in the patch"
			packageDiff := request patch diffAt: packagePath.
			packageDiff left packageArtifactDefinitions
				detect: [:each | each source = 'conflictMethod ^ 1']
				ifNone: [self fail: 'loaded edition of conflictMethod not on the left side'].
			"the second method should be there as well"
			packageDiff right packageArtifactDefinitions
				detect: [:each | each source = 'conflictMethod ^ 2']
				ifNone: [self fail: 'remote edition of conflictMethod not on the right side'].
			"resolve conflict"
			self assert: (packageDiff base packageArtifactDefinitions
				noneSatisfy: [:each | each source beginsWith: 'conflictMethod']).
			conflictNode := packageDiff topNodes first children first.
			self assert: (conflictNode title beginsWith: 'conflictMethod').
			conflictNode chooseLeft.
			request resume: request patch updateFromNodes]]
		valueSupplyingAnswers: {{'*'. #default}}.
	self assert: secondMethodSource
		equals: (sampleClass >> #conflictMethod) getSource asString
		description: 'conflict method unchanged after merge'.
	self assert: secondVersion equals: workingCopy lastLoadedHistorian version.