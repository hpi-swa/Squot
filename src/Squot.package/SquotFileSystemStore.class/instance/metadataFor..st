private metadata access
metadataFor: anArtifact
	"See also #readSquotMetadataForObjectAt:"
	| reference |
	^ SquotObjectMetadata on: ((reference := directory resolve: anArtifact path) isDirectory
		ifTrue: [reference / '_squot-contents']
		ifFalse: ["for single files" reference, 'squot-contents'])