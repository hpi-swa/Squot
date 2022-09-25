accessing artifacts
putArtifact: anArtifactSnapshot
	| serializer |
	serializer := SquotSmartRefStreamSerializer writingBelow: projectRootDirectory.
	serializer atPathOf: anArtifactSnapshot artifact writeStreamDo:
		[:artifactStream |
		serializer writeObject: anArtifactSnapshot objectSnapshot
			from: anArtifactSnapshot artifact].