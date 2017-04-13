enumerating
artifactsDo: aBlock
	self artifactReferencesDo: [:each |
		[aBlock value: (self restoreArtifactFrom: each)]
			on: SquotNoMetadataFileFound do: [:e |]].