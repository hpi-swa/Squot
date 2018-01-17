Squot-diff-converting
asSquotHierarchicalDiff
	"Answer a collection of top nodes of trees for a hierarchical diff.
	Refer to SquotDiffNode for the interface of the nodes."
	^ SquotMetaobjectDiffNodesBuilder new
		graphDiff: self;
		convertToNodes: self