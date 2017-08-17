instance creation
forObjectAt: aFileReference
	| metadataFile |
	metadataFile := (aFileReference isDirectory
		ifTrue: [self referenceToMetadataFileForDirectory: aFileReference]
		ifFalse: [self referenceToMetadataFileForFile: aFileReference]).
	^ self on: metadataFile