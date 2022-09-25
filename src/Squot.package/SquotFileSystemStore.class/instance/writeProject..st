accessing
writeProject: aSquotProject
	| tableOfContents |
	self shouldStoreMetadata ifFalse:
		[self tableOfContents delete.
		aSquotProject artifacts do:
			[:each | | fileOrDirectory |
			fileOrDirectory := directory resolve: (each storeInfo at: 'path').
			(self metadataForObjectAt: fileOrDirectory) delete].
		self flag: #todo. "Test" self isThisEverCalled.
		^ self].
	tableOfContents := self tableOfContents.
	tableOfContents removeAll.
	aSquotProject artifacts do: [:each | tableOfContents add: each].
	tableOfContents fileOut.
	aSquotProject artifacts do:
		[:each | | fileOrDirectory |
		fileOrDirectory := directory resolve: (each storeInfo at: 'path').
		(self metadataForObjectAt: fileOrDirectory) updateFrom: each storeInfo].