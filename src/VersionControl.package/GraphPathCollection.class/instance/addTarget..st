as yet unclassified
addTarget: aNode
	"paths stores one dictionary for each target node,
	each of the dictionaries stores the paths to this node"
	paths at: aNode put: Dictionary new.
	(paths at: aNode) at: aNode put: #().