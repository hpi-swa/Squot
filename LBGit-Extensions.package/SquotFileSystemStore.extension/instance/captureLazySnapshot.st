*LBGit-Extensions
captureLazySnapshot
	"read the table of contents and create lazy loading artifacts from the entries"
	| builder addedPaths unrecordedFiles |
	builder := SquotSnapshot builder.
	addedPaths := Set new.
	[self artifactReferencesDo: [:each | | lazyArtifact |
		lazyArtifact := self createLazyArtifactForObjectAt: each.
		builder add: lazyArtifact.
		addedPaths add: each path]]
	on: SquotNoTableOfContentsFound doAndPass: [:e |
		(self packageDirectoriesIn: directory)
			collect: 	[:eachDirectory | self createLazyArtifactForObjectAt: eachDirectory]
			thenDo: [:eachArtifact | builder add: eachArtifact.
				addedPaths add: eachArtifact path.
				e add: eachArtifact]].
	builder add: (unrecordedFiles := LBGitRecordedFilesArtifact new
		rootDirectory: directory;
		yourself).
	builder buildSnapshot
		in: [:snapshot |
			unrecordedFiles ownerSnapshot: snapshot.
			^ snapshot].