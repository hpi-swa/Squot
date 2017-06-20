converting
asSquotHierarchicalDiffWith: diffNodesBuilder
	"Answer a collection of top nodes of trees for a hierarchical diff.
	Refer to SquotDiffNode for the interface of the nodes."
	^ Array streamContents: [:nodes |
		changedInstVars keysAndValuesDo: [:instVarName :diff |
			nodes nextPut: (SquotDiffNode
				title: instVarName
				content: diff
				children: (diffNodesBuilder convertToNodes: diff))].
		changedVariablePart ifNotNil:
			[changedVariablePart keysAndValuesDo: [:index :diff |
				nodes nextPut: (SquotDiffNode
					title: index asString
					content: diff
					children: (diffNodesBuilder convertToNodes: diff))]]]