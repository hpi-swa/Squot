instance creation
forObjectAt: aFileReference
	| metadataFile |
	metadataFile := (aFileReference isDirectory
		ifTrue: [aFileReference / '.squot-contents']
		ifFalse: ["for single files"
			aFileReference parent / (aFileReference basename, '.squot-contents')]).
	^ self on: metadataFile