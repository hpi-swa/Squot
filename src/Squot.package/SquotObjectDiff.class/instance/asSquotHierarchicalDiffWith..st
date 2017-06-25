converting
asSquotHierarchicalDiffWith: diffNodesBuilder
	"Answer a collection of top nodes of trees for a hierarchical diff.
	Refer to SquotDiffNode for the interface of the nodes."
	^ slotChanges gather: [:each | each asSquotHierarchicalDiffWith: diffNodesBuilder]