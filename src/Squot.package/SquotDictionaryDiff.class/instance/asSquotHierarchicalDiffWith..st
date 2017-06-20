as yet unclassified
asSquotHierarchicalDiffWith: aDiffNodesBuilder
	"Answer a collection of top nodes of trees for a hierarchical diff.
	Refer to SquotDiffNode for the interface of the nodes."
	^ (Array streamContents: [:nodes |
		added keysAndValuesDo: [:key :addingDiff |
			nodes nextPut: (SquotDiffNode
				title: key
				content: addingDiff
				children: (aDiffNodesBuilder convertToNodes: addingDiff))].
		removed keysAndValuesDo: [:key :removingDiff |
			nodes nextPut: (SquotDiffNode
				title: key
				content: removingDiff
				children: (aDiffNodesBuilder convertToNodes: removingDiff))].
		modified keysAndValuesDo: [:key :diff |
			nodes nextPut: (SquotDiffNode
				title: key
				content: diff
				children: (aDiffNodesBuilder convertToNodes: diff))]]) ,
	(super asSquotHierarchicalDiffWith: aDiffNodesBuilder) 