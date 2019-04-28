as yet unclassified
isSquotFile: aPath

	^ (aPath = SquotFileSystemStore tocFileName)
		or: [aPath includesSubstring: SquotObjectMetadataFile metadataFileName]
		or: [aPath includesSubstring: 'squot-table-of-contents']
		or: [aPath includesSubstring: '.package']
		or: [self objectContainer includesObjectAt: aPath]