changes-operations
cleanDirectory: aReference
	aReference ensureDirectory.
	aReference children do: [:each |
		(SquotMetadataMapper new maps: each path)
			ifFalse: [each deleteAll]].