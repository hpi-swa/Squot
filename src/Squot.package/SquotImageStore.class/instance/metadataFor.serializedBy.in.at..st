private metadata access
metadataFor: anObject serializedBy: aSerializer in: aSnapshotBuilder at: aPath
	"See also #readSquotMetadataForObjectAt:"
	^ SquotObjectMetadata on: ((aSnapshotBuilder at: aPath) isDirectory
		ifTrue: [aSnapshotBuilder at: aPath,  '/_squot-contents']
		ifFalse: ["for single files" aSnapshotBuilder at: aPath, '.squot-contents'])