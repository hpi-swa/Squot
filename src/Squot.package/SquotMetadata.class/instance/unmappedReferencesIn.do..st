untracked-mappers
unmappedReferencesIn: aFileSystem do: aBlock
	SquotUnmappedReferencesVisitor new
		mappedPaths: (self trackedMappers gather: #mappedPaths);
		block: aBlock;
		show: aFileSystem root