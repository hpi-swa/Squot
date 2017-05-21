accessing
numberOfEntries
	numberOfEntries ifNil: [fileStream reset. self readStartFrom: fileStream].
	^ numberOfEntries