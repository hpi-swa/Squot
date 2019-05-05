Pur store
captureSnapshot
	"read files from the filesystem and convert them into SquotArtifacts"
	| builder addedPaths unrecordedFiles |
	builder := SquotSnapshot builder.
	addedPaths := Set new.
	'Reading objects from files' displaySequentialProgress:
	[[self artifactsDo: [:each | builder add: each.
		addedPaths add: each path]]
	on: SquotNoTableOfContentsFound doAndPass: [:e |
		(self packageDirectoriesIn: directory)
			collect: 	[:eachDirectory | self restorePackageFrom: eachDirectory]
			thenDo: [:eachArtifact | builder add: eachArtifact.
				addedPaths add: eachArtifact path.
				e add: eachArtifact]]].
	builder add: (unrecordedFiles := SquotTrackedFilesArtifact new
		rootDirectory: directory;
		yourself).
	builder buildSnapshot
		in: [:snapshot |
			unrecordedFiles objectContainer: snapshot.
			^ snapshot].