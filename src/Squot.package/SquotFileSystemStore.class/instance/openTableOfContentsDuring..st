patching
openTableOfContentsDuring: aBlock
	tableOfContentsDuringTransaction := self tableOfContents.
	^ aBlock ensure:
		[self shouldStoreMetadata
			ifTrue: [tableOfContentsDuringTransaction fileOut]
			ifFalse: [tableOfContentsDuringTransaction delete].
		tableOfContentsDuringTransaction := nil]