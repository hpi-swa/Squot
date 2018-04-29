tests
testMergeWithoutConflicts
	| sampleClass packagePath firstVersion secondMethodSource secondVersion  thirdMethodSource thirdVersion otherHistorian packageInfo |
	"create a base version"
	self suppressChangeNotificationsDuring: [sampleClass := classFactory newClass].
	sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	packageInfo := PackageInfo named: classFactory packageName.
	workingCopy add: packageInfo at: 'src'.
	workingCopy saveNewVersionMessage: 'first version' interactive: false.
	packagePath := (workingCopy store pathsOf: (PackageInfo named: classFactory packageName)) anyOne.
	firstVersion := workingCopy baseVersion.
	"create first merge parent"
	sampleClass compileSilently: (secondMethodSource := 'secondMethod ^ self') classified: 'methods of second version'.
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	secondVersion := workingCopy baseVersion.
	"create second merge parent"
	firstVersion snapshot in: [:firstSnapshot | | packageArtifact newSnapshot |
		packageArtifact := firstSnapshot artifactAt: packagePath.
		newSnapshot := firstSnapshot createNewBuilder
			add: (((MCSnapshot fromDefinitions: packageArtifact packageArtifactDefinitions,
					{MCMethodDefinition className: sampleClass name
						selector: #thirdMethod category: 'methods of third version'
						timeStamp: 'whatever'
						source: (thirdMethodSource := 'thirdMethod ^ self')})
					asSquotArtifactForPackage: packageInfo)
					path: packagePath);
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
		on: SquotSelectionOfChangesRequested do: [:request |
			"make sure the third method will be added"
			(request patch diffAt: packagePath) diffOfTrackedObject operations
				detect: [:each | each definition isMethodDefinition and: [each toSource asString = thirdMethodSource]]
				ifNone: [self fail: 'third method not in the patch'].
			"the second method should not be modified"
			self deny: ((request patch diffAt: packagePath) diffOfTrackedObject
					operations anySatisfy: [:each |
					each definition isMethodDefinition and: [each fromSource asString = secondMethodSource]]).
			request resume: request patch "accept all changes"]]
		valueSupplyingAnswers: {{'*'. #default}}].
	self assert: secondMethodSource
		equals: (sampleClass >> #secondMethod) getSource asString
		description: 'second method unchanged after merge'.
	self assert: thirdMethodSource
		equals: (sampleClass >> #thirdMethod) getSource asString
		description: 'third method loaded after merge'.
	self assert: secondVersion equals: workingCopy lastLoadedHistorian version.