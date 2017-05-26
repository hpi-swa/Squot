tests
testMergeVersionWithLoadedObjects
	| sampleClass packagePath firstVersion addedMethodSource secondVersion |
	"create a base version"
	sampleClass := classFactory newClass.
	sampleClass compile: 'firstMethod ^ self' classified: 'methods of first version'.
	workingCopy add: (PackageInfo named: classFactory packageName) at: 'src'.
	packagePath := (workingCopy store pathsOf: (PackageInfo named: classFactory packageName)) anyOne.
	workingCopy saveNewVersionMessage: 'first version' interactive: false.
	firstVersion := workingCopy baseVersion.
	"create unsaved changes"
	sampleClass compile: (addedMethodSource := 'addedMethod ^ self') classified: 'unsaved methods'.
	"create a yet unloaded followup version"
	firstVersion snapshot in: [:firstSnapshot | | packageArtifact newSnapshot |
		packageArtifact := firstSnapshot artifactAt: packagePath.
		newSnapshot := firstSnapshot createNewBuilder
			add: (packageArtifact copyWithDifferentContent:
				(MCSnapshot fromDefinitions: packageArtifact content definitions,
					{MCMethodDefinition className: sampleClass name
						selector: #anotherMethod category: 'methods of second version'
						timeStamp: 'whatever' source: 'anotherMethod ^ self'}));
			buildSnapshot.
		secondVersion := workingCopy loadedHistorian createNewVersion: newSnapshot
			with: [:newVersion | newVersion message: 'second version']].
	"merge the second version
	and assert that no attempt is made to discard the unsaved method"
	[[workingCopy mergeVersionWithLoadedObjects: secondVersion]
		on: SquotSelectionOfChangesRequested do: [:request |
			"make sure the unsaved method is present and the same on both sides"
			(request originalSnapshot artifactAt: packagePath) content definitions
				detect: [:each |
					each isMethodDefinition and: [each source = addedMethodSource]]
				ifNone: [self fail: 'unsaved method not present on the left side'].
			(request proposedSnapshot artifactAt: packagePath) content definitions
				detect: [:each | each isMethodDefinition and: [each source = addedMethodSource]]
				ifNone: [self fail: 'unsaved method not present on the right side'].
			request resume: request proposedSnapshot artifacts "all of them"]]
		valueSupplyingAnswers: {{'*'. #default}}.
	self assert: addedMethodSource
		equals: (sampleClass >> #addedMethod) getSource asString
		description: 'unsaved method unchanged after merge'.
	self assert: secondVersion equals: workingCopy lastLoadedHistorian version.