setUp
createThirdVersion
	| firstSnapshot packageArtifact newSnapshot |
	firstSnapshot := firstVersion snapshot.
	packageArtifact := firstSnapshot artifactAt: packageId.
	newSnapshot :=
		firstSnapshot createNewBuilder
			add: (((MCSnapshot fromDefinitions:
					(firstSnapshot packageDefinitionsOfArtifact: packageArtifact) ,
					{thirdMethod := MCMethodDefinition
						className: sampleClass name
						selector: #thirdMethod
						category: 'methods of third version'
						timeStamp: 'whatever'
						source: ('thirdMethod ^ self')})
				asSquotArtifactForPackage: packageInfo)
				id: packageArtifact id;
				yourself);
			 buildSnapshot.
	otherHistorian := repository historianNamed: 'other'.
	otherHistorian version: firstVersion.
	thirdVersion := otherHistorian
				createNewVersion: newSnapshot
				with: [:newVersion |
					newVersion message: 'third version';
						author: workingCopy defaultAuthor;
						timestamp: DateAndTime now - 1 minute].
	^ thirdVersion