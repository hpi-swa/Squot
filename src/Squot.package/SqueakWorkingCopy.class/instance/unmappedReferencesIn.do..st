paths
unmappedReferencesIn: anFSCommit do: aBlock
	SquotUnmappedReferencesVisitor new
		mappedPaths: self mappedPaths;
		block: aBlock;
		show: anFSCommit filesystem root.