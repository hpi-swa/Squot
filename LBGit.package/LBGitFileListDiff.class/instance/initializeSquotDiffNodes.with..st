Squot-diff-converting
initializeSquotDiffNodes: aCollection with: aSquotDiffNodesBuilder
	"Initialize the previously allocated diff nodes in aCollection, using the builder to convert
	the diffs of related objects."
	"Allocating the nodes and initializing them is separated to facilitate cycle breaking
	when graphs of changed objects are converted to diff nodes. If all related diffs form
	a tree structure and you chose to initialize all nodes upon their allocation already,
	you may implement this method to do nothing."
	| index |
	index := 1.
	self deprecated.
	self added do: [:each | (aCollection at: index)
		title: 'added: ', each
		content: self
		children: Array empty.
		index := index + 1.].
	self removed do: [:each | (aCollection at: index)
		title: 'deleted: ', each
		content: self
		children: Array empty.
		index := index + 1.].
	self modified do: [:each | (aCollection at: index)
		title: 'modified:  ', each
		content: self
		children: Array empty.
		index := index + 1.].