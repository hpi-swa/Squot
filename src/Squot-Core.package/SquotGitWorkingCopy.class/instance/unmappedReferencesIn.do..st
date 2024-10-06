paths
unmappedReferencesIn: anFSCommit do: aBlock
	SquotUnmappedReferencesVisitor new
		mappedPathPatterns: self mappedPathPatterns;
		block: aBlock;
		show: anFSCommit filesystem root.