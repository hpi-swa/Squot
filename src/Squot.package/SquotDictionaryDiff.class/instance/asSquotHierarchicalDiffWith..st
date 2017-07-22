converting
asSquotHierarchicalDiffWith: aDiffNodesBuilder
	"Answer a collection of top nodes of trees for a hierarchical diff.
	Refer to SquotDiffNode for the interface of the nodes."
	^ (Array streamContents: [:nodes |
		itemChanges associations do: [:itemDiff |
			aDiffNodesBuilder convertToNodes: itemDiff]]) ,
	(super asSquotHierarchicalDiffWith: aDiffNodesBuilder) 