printing
setItem: aSquitVersion
	| date commitHash author message decoration |
	super setItem: aSquitVersion.
	date := self formatDate: (aSquitVersion metadata at: #timestamp).
	commitHash := aSquitVersion shortId.
	author := (aSquitVersion metadata at: #author) withBlanksTrimmed contractTo: 16.
	message := (aSquitVersion message lines ifNotEmptyDo: #first ifEmpty: '') truncateWithElipsisTo: 80.
	decoration := ''.
	decoration := ((aSquitVersion repository historians, aSquitVersion repository remoteHistorians select: [:each | each version = aSquitVersion])
		collect: [:each | each shortName]) joinSeparatedBy: ', '.
	decoration ifNotEmpty: [decoration := '[', decoration, '] '].
	self string: date, String tab, author, String tab, decoration, message.