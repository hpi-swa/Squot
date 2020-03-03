tests
testMergeVersionWithLoadedObjects
	| sampleClass packagePath firstVersion addedMethod secondVersion packageInfo |
	repository withUnitOfWork:
	["create a base version"
	self suppressChangeNotificationsDuring:
		[classFactory cleanUp.
		sampleClass := classFactory newClass].
	sampleClass compileSilently: 'firstMethod ^ self' classified: 'methods of first version'.
	packageInfo := self addPackage.
	workingCopy saveVersionWithMessage: 'first version'.
	packagePath := (workingCopy store pathsOf: packageInfo) anyOne.
	firstVersion := workingCopy baseVersion.
	"create unsaved changes"
	addedMethod := sampleClass compileSilently: 'addedMethod ^ self' classified: 'unsaved methods'.
	addedMethod := sampleClass >> addedMethod.
	"create a yet unloaded followup version"
	firstVersion snapshot in: [:firstSnapshot | | packageArtifact newSnapshot |
		packageArtifact := firstSnapshot artifactAt: packagePath.
		newSnapshot := firstSnapshot createNewBuilder
			add: (packageArtifact copyWithDifferentContent:
				((MCSnapshot fromDefinitions: packageArtifact packageArtifactDefinitions,
					{MCMethodDefinition className: sampleClass name
						selector: #anotherMethod category: 'methods of second version'
						timeStamp: 'whatever' source: 'anotherMethod ^ self'})
					asSquotArtifactForPackage: packageInfo) content);
			buildSnapshot.
		secondVersion := workingCopy loadedHistorian createNewVersion: newSnapshot
			with: [:newVersion | newVersion message: 'second version']].
	"merge the second version
	and assert that no attempt is made to discard the unsaved method"
	self suppressChangeNotificationsDuring:
	[[[workingCopy mergeVersionWithLoadedObjects: secondVersion
			ifCanceled: [self fail: 'should not reach here']]
		on: SquotMergeRequested do: [:request | | packageMerge packageDiff |
			"make sure the unsaved method does not appear in the diff (will not be changed)"
			packageMerge := request merge mergeAt: packagePath.
			self deny: packageMerge hasConflicts.
			packageDiff := packageMerge resolvedPatch.
			self assert: (packageDiff diffOfTrackedObject operations
				noneSatisfy: [:each | each definition isMethodDefinition and: [each definition selector = addedMethod selector]]).
			request resume]]
		valueSupplyingAnswers: {{'*'. #default}}].
	self assert: addedMethod
		equals: sampleClass >> #addedMethod
		description: 'unsaved method unchanged after merge'.
	self assert: firstVersion equals: workingCopy loadedVersion].