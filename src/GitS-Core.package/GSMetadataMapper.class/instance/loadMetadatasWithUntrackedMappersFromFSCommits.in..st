metadata-loading
loadMetadatasWithUntrackedMappersFromFSCommits: aCollection in: aWorkingCopy
	| fileSystems mappedPathPatterns metadatas unmappedPaths untrackedMappers |
	fileSystems := aCollection collect: #filesystem.
	metadatas := fileSystems collect: [:fileSystem | self loadMetadataFromFileSystem: fileSystem in: aWorkingCopy].
	mappedPathPatterns := Set new.
	metadatas do: [:metadata | metadata mappers do: [:mapper | mappedPathPatterns addAll: mapper mappedPathPatterns]].
	unmappedPaths := Set new.
	metadatas with: fileSystems do: [:metadata :fileSystem |
		metadata unmappedReferencesIn: fileSystem do: [:each | unmappedPaths add: each path]].
	untrackedMappers := aCollection collect: [:each | OrderedCollection new].
	unmappedPaths
		do: [:path |
			(self
				shouldLoadUntrackedMappersAt: path
				fromFSCommits: aCollection
				withMappedPathPatterns: mappedPathPatterns) ifTrue: [
				fileSystems with: untrackedMappers do: [:fileSystem :mappers | | reference |
					reference := fileSystem referenceTo: path.
					reference isFile ifTrue: [mappers add: (self untrackedMapperForReference: reference)]]]]
		displayingProgress: [:path | 'Scanning for potential changes in untracked file {1}' format: {GSPathUtilities asString: path}].
	^ metadatas with: untrackedMappers collect: [:metadata :mappers | metadata withAddedMappers: mappers]