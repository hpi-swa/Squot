private
deserialize: anArtifact in: aFileOrDirectory
	| deserializer |
	deserializer := self findDeserializerFor: anArtifact in: aFileOrDirectory.
	deserializer new fillContentOf: anArtifact from: aFileOrDirectory.