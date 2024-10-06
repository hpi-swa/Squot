untracked-mappers
unmappedReferencesIn: aFileSystem do: aBlock
	SquotUnmappedReferencesVisitor new
		mappedPathPatterns: self mappedPathPatterns;
		block: aBlock;
		show: aFileSystem root