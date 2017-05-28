Pur store
captureLazySnapshot
	"read the table of contents and create lazy loading artifacts from the entries"
	| builder addedPaths unrecordedFiles |
	builder := SquotSnapshot builder.
	addedPaths := Set new.
	[self artifactReferencesDo: [:each | | lazyArtifact |
		lazyArtifact := self createLazyArtifactForObjectAt: each.
		builder add: lazyArtifact.
		addedPaths add: each path]]
		on: SquotNoTableOfContentsFound do: [:e |
			(self packageDirectoriesIn: directory)
				collect: 	[:eachDirectory | self createLazyArtifactForObjectAt: eachDirectory]
				thenDo: [:eachArtifact | builder add: eachArtifact.
					addedPaths add: eachArtifact path.
					e addArtifactAt: eachArtifact path
						serializedBy: PackageInfo squotPreferredSerializer name].
			e pass].
	builder add: (unrecordedFiles := SquotUnrecordedFilesArtifact new
		rootDirectory: directory;
		yourself).
	builder buildSnapshot
		in: [:snapshot |
			unrecordedFiles ownerSnapshot: snapshot.
			^ snapshot].