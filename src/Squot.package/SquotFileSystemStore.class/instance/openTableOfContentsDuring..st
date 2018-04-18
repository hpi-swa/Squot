patching
openTableOfContentsDuring: aBlock
	tableOfContentsDuringTransaction := self tableOfContents.
	aBlock ensure:
		[self shouldStoreMetadata ifTrue: [tableOfContentsDuringTransaction fileOut].
		tableOfContentsDuringTransaction := nil]