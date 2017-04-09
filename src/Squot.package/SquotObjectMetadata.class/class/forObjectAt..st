instance creation
forObjectAt: aFileReference
	| metadataFile |
	metadataFile := (aFileReference isDirectory
		ifTrue: [aFileReference / '_squot-contents']
		ifFalse: ["for single files"
			aFileReference parent / (aFileReference basename, '.squot-contents')]).
	^ self on: metadataFile