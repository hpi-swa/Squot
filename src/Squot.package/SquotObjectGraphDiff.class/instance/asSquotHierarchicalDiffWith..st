Squot-diff-converting
asSquotHierarchicalDiffWith: aDiffNodesBuilder
	"Answer a collection of top nodes of trees for a hierarchical diff.
	Refer to SquotDiffNode for the interface of the nodes."
	^ self startDiff ifNil: [#()] ifNotNil: [:diff | aDiffNodesBuilder convertToNodes: diff]