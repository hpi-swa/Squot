as yet unclassified
allChildren
	"Return all the files and folders recursively nested in the receiver"
	
	^ FSCollectVisitor breadthFirst: self collect: [:ea | ea reference]