tests
testMergeWithConflictsChooseRemote
	| sampleClass packagePath firstVersion secondMethodSource secondVersion  thirdMethodSource thirdVersion otherHistorian |
	"create a base version"
	classFactory cleanUp.
	sampleClass := classFactory newClass.
	workingCopy add: (PackageInfo named: classFactory packageName) at: 'src'.
	packagePath := (workingCopy store pathsOf: (PackageInfo named: classFactory packageName)) anyOne.
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
				(MCSnapshot fromDefinitions: packageArtifact content definitions,
					{MCMethodDefinition className: sampleClass name
						selector: #conflictMethod category: 'conflict methods'
						timeStamp: 'whatever'
						source: (thirdMethodSource := 'conflictMethod ^ 2')}));
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
			conflictNode := packageDiff topNodes first children first.
			self assert: (conflictNode title beginsWith: 'conflictMethod').
			conflictNode chooseRight.
			request resume: request patch updateFromNodes]]
		valueSupplyingAnswers: {{'*'. #default}}.
	self assert: thirdMethodSource
		equals: (sampleClass >> #conflictMethod) getSource asString
		description: 'conflict method updated after merge'.
	self assert: secondVersion equals: workingCopy lastLoadedHistorian version.