metadata-loading
loadMetadatasWithUntrackedMappersFromFSCommits: aCollection in: aWorkingCopy
	| fileSystems mappedPaths metadatas unmappedPaths untrackedMappers |
	fileSystems := aCollection collect: #filesystem.
	metadatas := fileSystems collect: [:fileSystem | self loadMetadataFromFileSystem: fileSystem in: aWorkingCopy].
	mappedPaths := Set new.
	metadatas do: [:metadata | metadata mappers do: [:mapper | mappedPaths addAll: mapper mappedPaths]].
	unmappedPaths := Set new.
	metadatas with: fileSystems do: [:metadata :fileSystem |
		metadata unmappedReferencesIn: fileSystem do: [:each | unmappedPaths add: each path]].
	untrackedMappers := aCollection collect: [:each | OrderedCollection new].
	unmappedPaths
		do: [:path |
			(self
				shouldLoadUntrackedMappersAt: path
				fromFSCommits: aCollection
				withMappedPaths: mappedPaths) ifTrue: [
				fileSystems with: untrackedMappers do: [:fileSystem :mappers | | reference |
					reference := fileSystem referenceTo: path.
					reference exists ifTrue: [mappers add: (self untrackedMapperForReference: reference)]]]]
		displayingProgress: [:path | 'Scanning for potential changes in untracked file {1}' format: {SquotPathUtilities asString: path}].
	^ metadatas with: untrackedMappers collect: [:metadata :mappers | metadata withAddedMappers: mappers]