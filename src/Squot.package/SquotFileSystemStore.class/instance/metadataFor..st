private metadata access
metadataFor: anArtifact
	"See also #readSquotMetadataForObjectAt:"
	| fileName reference |
	fileName := self class metadataFileName.
	^ SquotObjectMetadata on: ((reference := directory resolve: anArtifact path) isDirectory
		ifTrue: [reference / fileName]
		ifFalse: ["for single files" reference, fileName])