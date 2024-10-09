changes-operations
cleanDirectory: aReference
	aReference ensureDirectory.
	aReference children do: [:each |
		(GSMetadataMapper new maps: each path)
			ifFalse: [each deleteAll]].