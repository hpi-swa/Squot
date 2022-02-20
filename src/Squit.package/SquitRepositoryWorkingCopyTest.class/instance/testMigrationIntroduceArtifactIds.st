tests
testMigrationIntroduceArtifactIds
	"Given a repository with no artifact ids"
	workingCopy repository withUnitOfWork:
		[| git fs metadataFile |
		workingCopy add: Object new at: 'x'.
		workingCopy saveVersionWithMessage: 'add artifact'.
		git := workingCopy loadedHistorian git.
		fs := workingCopy repository fsgitRepository head.
		metadataFile := SquotObjectMetadataFile on: fs root / '.x.squot-contents'.
		metadataFile updateFrom: (metadataFile metadata removeKey: #id; yourself).
		fs commit: 'Remove id'.
		(workingCopy store metadataForObjectAt: 'x') removeKey: #id.
		self deny: ((SquotObjectMetadataFile on: fs root / '.x.squot-contents') metadata includesKey: #id).
	"When a new version is saved, an id is written in the repository."
		workingCopy saveVersionWithMessage: 'Next version'.
		self assert: (workingCopy artifactAt: 'x') id notNil;
			assert: ((workingCopy artifactAt: 'x') storeInfo at: #id) notNil;
			assert: (workingCopy artifactAt: 'x') id equals: (workingCopy baseVersion artifactAt: 'x') id;
			assert: (workingCopy artifactAt: 'x') id equals: ((workingCopy baseVersion artifactAt: 'x') storeInfo at: #id)].