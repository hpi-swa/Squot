running
createSecondMergeParent
	firstVersion snapshot
		in: [:firstSnapshot | 
			| packageArtifact newSnapshot |
			packageArtifact := firstSnapshot artifactAt: packagePath.
			newSnapshot := firstSnapshot createNewBuilder
						add: ((MCSnapshot fromDefinitions:
								packageArtifact packageArtifactDefinitions ,
								{MCMethodDefinition
									className: sampleClass name
									selector: #conflictMethod
									category: 'conflict methods'
									timeStamp: 'whatever'
									source: (thirdMethodSource := 'conflictMethod ^ 2')})
							asSquotArtifactForPackage: packageInfo);
						 buildSnapshot.
			otherHistorian := repository historianNamed: 'other'.
			otherHistorian version: firstVersion.
			thirdVersion := otherHistorian
						createNewVersion: newSnapshot
						with: [:newVersion | newVersion message: 'third version']].