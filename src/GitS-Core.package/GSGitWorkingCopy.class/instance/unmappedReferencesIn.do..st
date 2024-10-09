paths
unmappedReferencesIn: anFSCommit do: aBlock
	GSUnmappedReferencesVisitor new
		mappedPathPatterns: self mappedPathPatterns;
		block: aBlock;
		show: anFSCommit filesystem root.