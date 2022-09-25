accessing artifacts
readArtifact: anArtifact
	| file deserializer snapshot |
	file := projectRootDirectory resolve: (anArtifact storeInfo at: 'path').
	deserializer := SquotSmartRefStreamDeserializer new.
	snapshot := deserializer readFrom: file.
	^ SquotArtifactSnapshot artifact: anArtifact objectSnapshot: snapshot