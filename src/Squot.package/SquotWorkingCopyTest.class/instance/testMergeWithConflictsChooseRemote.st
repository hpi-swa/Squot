tests
testMergeWithConflictsChooseRemote
	| sampleClass packagePath firstVersion secondMethodSource secondVersion  thirdMethodSource thirdVersion otherHistorian packageInfo |
	"create a base version"
	classFactory cleanUp.
	self suppressChangeNotificationsDuring: [sampleClass := classFactory newClass].
	packageInfo := PackageInfo named: classFactory packageName.
	workingCopy add: packageInfo at: 'src'.
	workingCopy saveNewVersionMessage: 'first version' interactive: false.
	packagePath := (workingCopy store pathsOf: (PackageInfo named: classFactory packageName)) anyOne.
	firstVersion := workingCopy baseVersion.
	"create first merge parent"
	sampleClass compileSilently: (secondMethodSource := 'conflictMethod ^ 1') classified: 'conflict methods'.
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	secondVersion := workingCopy baseVersion.
	"create second merge parent"
	firstVersion snapshot in: [:firstSnapshot | | packageArtifact newSnapshot |
		packageArtifact := firstSnapshot artifactAt: packagePath.
		newSnapshot := firstSnapshot createNewBuilder
			add: (packageArtifact copyWithDifferentContent:
				((MCSnapshot fromDefinitions: packageArtifact packageArtifactDefinitions,
					{MCMethodDefinition className: sampleClass name
						selector: #conflictMethod category: 'conflict methods'
						timeStamp: 'whatever'
						source: (thirdMethodSource := 'conflictMethod ^ 2')})
					asSquotArtifactForPackage: packageInfo) content);
			buildSnapshot.
		otherHistorian := repository historianNamed: 'other'.
		otherHistorian version: firstVersion.
		thirdVersion := otherHistorian createNewVersion: newSnapshot
			with: [:newVersion | newVersion message: 'third version']].
	"merge the version of the other historian"
	self suppressChangeNotificationsDuring:
	[[[workingCopy
		mergeVersionInteractively: thirdVersion
		ifCanceled: [self fail: 'this code should not be reached']]
		on: SquotMergeRequested do: [:request | | packageDiff conflictNode |
			"make sure the second and third method edition are in the patch"
			packageDiff := request merge diffAt: packagePath.
			conflictNode := packageDiff asDiffTree children first children first.
			self assert: (conflictNode title beginsWith: 'conflictMethod').
			conflictNode chooseRight.
			request resume]]
		valueSupplyingAnswers: {{'*'. #default}}].
	self assert: sampleClass new conflictMethod = 2
		description: 'conflict method updated after merge'.
	self assert: secondVersion equals: workingCopy loadedVersion.