instance creation
forObjectAt: aFileReference
	| fileName metadataFile |
	fileName := SquotFileSystemStore metadataFileName.
	metadataFile := (aFileReference isDirectory
		ifTrue: [aFileReference / fileName]
		ifFalse: ["for single files"
			aFileReference parent / (aFileReference basename, fileName)]).
	^ self on: metadataFile