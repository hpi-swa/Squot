Squot-diff-converting
newSquotDiffNodes
	"Answer new, uninitialized SquotDiffNodes that will later be initialized 
	in #initializeSquotDiffNodes:with:"
	"Allocating the nodes and initializing them is separated to facilitate cycle breaking
	when graphs of changed objects are converted to diff nodes. If all related diffs form
	a tree structure, you may also fully initialize the nodes here already."
	^ Array with: SquotDiffNode new