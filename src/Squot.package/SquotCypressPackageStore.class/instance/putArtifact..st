accessing artifacts
putArtifact: anArtifactSnapshot
	| serializer |
	serializer := SquotCypressCodeSerializer new.
	serializer initializeFileTreeWritersInPackageDirectory: (projectRootDirectory resolve: (anArtifactSnapshot artifact storeInfo at: 'path')).
	anArtifactSnapshot objectSnapshot startShadow squotWrite: nil with: serializer.
	serializer writePropertiesIfExists.