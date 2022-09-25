accessing artifacts
readArtifact: anArtifact
	| deserializer directory snapshot migratedArtifact |
	deserializer := SquotCypressCodeDeserializer new.
	directory := projectRootDirectory resolve: (anArtifact storeInfo at: 'path').
	snapshot := deserializer readPackageFrom: directory.
	migratedArtifact := self migrateOldArtifact: anArtifact snapshot: snapshot.
	^ SquotArtifactSnapshot artifact: migratedArtifact objectSnapshot: snapshot