instance creation
forObjectAt: aFileReference
	| metadataFile |
	metadataFile := (aFileReference isDirectory
		ifTrue: [self referenceToMetadataFileForDirectory: aFileReference]
		ifFalse: ["for single files"
			aFileReference parent / (aFileReference basename, self metadataFileName)]).
	^ self on: metadataFile