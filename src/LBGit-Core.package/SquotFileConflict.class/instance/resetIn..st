as yet unclassified
resetIn: aSquotFileListDiff

	self leftChange excludeIn: aSquotFileListDiff.
	self rightChange excludeIn: aSquotFileListDiff.
	super includeIn: aSquotFileListDiff.