printing
setItem: aSquitVersion
	| date commitHash author message decoration |
	super setItem: aSquitVersion.
	date := self formatDate: (aSquitVersion metadata at: #timestamp).
	commitHash := aSquitVersion shortId.
	author := (aSquitVersion metadata at: #author) withBlanksTrimmed contractTo: 16.
	message := (aSquitVersion message lines ifNotEmptyDo: #first ifEmpty: '') truncateWithElipsisTo: 80.
	decoration := ''.
	(model model historiansDecorationAtVersion: aSquitVersion) ifNotNil: [:historians |
		decoration := '[', ((historians collect: [:each | each shortName]) joinSeparatedBy: ']['), '] '].
	self string: date, String tab, author, String tab, decoration, message.