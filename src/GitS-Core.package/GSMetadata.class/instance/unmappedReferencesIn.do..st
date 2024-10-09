untracked-mappers
unmappedReferencesIn: aFileSystem do: aBlock
	GSUnmappedReferencesVisitor new
		mappedPathPatterns: self mappedPathPatterns;
		block: aBlock;
		show: aFileSystem root