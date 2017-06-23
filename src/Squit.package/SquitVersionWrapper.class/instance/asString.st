printing
asString
	| date commitHash author message |
	date := self formatDate: (self item metadata at: #timestamp).
	commitHash :=  self item shortId.
	author := (self item metadata at: #author) withBlanksTrimmed contractTo: 16.
	message := (self item message lines ifNotEmptyDo: #first ifEmpty: '') truncateWithElipsisTo: 80.
	^ date, String tab, author, String tab, message