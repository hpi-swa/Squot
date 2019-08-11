tests
testMergeWithoutConflicts
	| sampleClass packagePath firstVersion secondMethod secondVersion  thirdMethod thirdVersion otherHistorian packageInfo |
	"create a base version"
	self suppressChangeNotificationsDuring: [sampleClass := classFactory newClass].
	sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	packageInfo := PackageInfo named: classFactory packageName.
	workingCopy add: packageInfo at: 'src'.
	workingCopy saveNewVersionMessage: 'first version' interactive: false.
	packagePath := (workingCopy store pathsOf: (PackageInfo named: classFactory packageName)) anyOne.
	firstVersion := workingCopy baseVersion.
	"create first merge parent"
	secondMethod := sampleClass compileSilently: 'secondMethod ^ self' classified: 'methods of second version'.
	secondMethod := sampleClass >> secondMethod.
	workingCopy saveNewVersionMessage: 'second version' interactive: false.
	secondVersion := workingCopy baseVersion.
	"create second merge parent"
	firstVersion snapshot in: [:firstSnapshot | | packageArtifact newSnapshot |
		packageArtifact := firstSnapshot artifactAt: packagePath.
		newSnapshot := firstSnapshot createNewBuilder
			add: (((MCSnapshot fromDefinitions: packageArtifact packageArtifactDefinitions,
					{thirdMethod := MCMethodDefinition className: sampleClass name
						selector: #thirdMethod category: 'methods of third version'
						timeStamp: 'whatever'
						source: 'thirdMethod ^ self'})
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
		on: SquotMergeRequested do: [:request |
			"make sure the third method will be added"
			(request merge mergeAt: packagePath) diffOfTrackedObject operations
				detect: [:each | each definition isMethodDefinition and: [each toSource asString = thirdMethod source]]
				ifNone: [self fail: 'third method not in the patch'].
			"the second method should not be modified"
			self deny: ((request merge mergeAt: packagePath) diffOfTrackedObject
					operations anySatisfy: [:each |
					each definition isMethodDefinition and: [each definition selector = secondMethod selector]]).
			request resume "accept all changes"]]
		valueSupplyingAnswers: {{'*'. #default}}].
	self assert: secondMethod
		equals: sampleClass >> #secondMethod
		description: 'second method unchanged after merge'.
	self assert: (sampleClass includesSelector: #thirdMethod)
		description: 'third method loaded after merge'.
	self assert: secondVersion equals: workingCopy loadedVersion.