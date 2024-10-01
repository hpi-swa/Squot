untracked-mappers
untrackedMappersIn: aFileSystem
	^ Array streamContents: [:stream |
		SquotUnmappedReferencesVisitor new
			mappedPaths: (self trackedMappers gather: #mappedPaths);
			block: [:reference | stream nextPut: (self untrackedMapperForReference: reference)];
			show: aFileSystem root]