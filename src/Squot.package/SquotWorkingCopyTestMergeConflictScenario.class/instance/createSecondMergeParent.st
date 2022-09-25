setUp
createSecondMergeParent
	| firstSnapshot packageArtifact newMCSnapshot newSnapshot |
	firstSnapshot :=  firstVersion snapshot.
	packageArtifact := firstSnapshot artifactAt: packagePath.
	newMCSnapshot := MCSnapshot fromDefinitions:
						(firstSnapshot packageDefinitionsOfArtifact: packageArtifact) ,
						{MCMethodDefinition
							className: sampleClass name
							selector: #conflictMethod
							category: 'conflict methods'
							timeStamp: 'whatever'
							source: ('conflictMethod ^ 2').
						MCMethodDefinition
							className: sampleClass name
							selector: #thirdMethod
							category: 'methods of third version'
							timeStamp: 'whatever'
							source: (thirdMethodSource := 'thirdMethod ^ self')}.
	newSnapshot := firstSnapshot createNewBuilder
				add: (SquotToggles useNewApi 
						ifTrue: [SquotArtifactSnapshot
									artifact: packageArtifact copy
									objectSnapshot: (SquotShadowGraph withSingleShadow:
										((firstSnapshot snapshotArtifact: packageArtifact) objectSnapshot startShadow copyWithSnapshot: newMCSnapshot))]
						ifFalse: [newMCSnapshot asSquotArtifactForPackage: packageInfo]);
				 buildSnapshot.
	otherHistorian := repository historianNamed: 'other'.
	otherHistorian version: firstVersion.
	thirdVersion := otherHistorian
				createNewVersion: newSnapshot
				with: [:newVersion |
					newVersion message: 'third version';
						author: workingCopy defaultAuthor].