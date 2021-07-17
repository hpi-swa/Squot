setUp
createSecondMergeParent
	
	firstVersion snapshot
		in: [:firstSnapshot | 
			| newSnapshot |
			newSnapshot := firstSnapshot createNewBuilder
						add: ((MCSnapshot fromDefinitions: (self 
								secondMergeParentDefinitionsFor: firstSnapshot))
							asSquotArtifactForPackage: packageInfo);
						 buildSnapshot.
			otherHistorian := repository historianNamed: 'other'.
			otherHistorian version: firstVersion.
			thirdVersion := otherHistorian
						createNewVersion: newSnapshot
						with: [:newVersion |
							newVersion message: 'third version';
								author: workingCopy defaultAuthor]].