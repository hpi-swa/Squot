as yet unclassified
numberOfEntries
	numberOfEntries ifNil: [fileStream reset. self readStartFrom: fileStream].
	^ numberOfEntries