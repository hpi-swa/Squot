as yet unclassified
asDiffTree

	^ SquotDiffNode 
		title: SquotFilesArtifact path
		content: self 
		children: self topNodes
		onInclude: [] 
		onExclude: []