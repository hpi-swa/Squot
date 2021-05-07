*Squot-Tools
optionalMetadataNode
	| nodes |
	nodes := self metadataTreeNodes.
	nodes ifEmpty: [^ #()].
	^ {SquotDiffNode
		title: '[', 'Metadata' translated, ']'
		content: nil
		children: nodes
		onInclude: []
		onExclude: []}