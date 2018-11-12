Squot-diff-converting
initializeSquotDiffNodes: aCollection with: aSquotDiffNodesBuilder
	"Initialize the previously allocated diff nodes in aCollection, using the builder to convert
	the diffs of related objects."
	"Allocating the nodes and initializing them is separated to facilitate cycle breaking
	when graphs of changed objects are converted to diff nodes. If all related diffs form
	a tree structure and you chose to initialize all nodes upon their allocation already,
	you may implement this method to do nothing."
	aCollection first 
		title: 'changes'
		content: self
		children: Array empty.