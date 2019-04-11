as yet unclassified
asDiffTree

	^ SquotDiffNode 
		title: LBGitFilesArtifact path
		content: self 
		children: self topNodes
		onInclude: [] 
		onExclude: []