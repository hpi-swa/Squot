toolbuilder
formatDate: aDateAndTime

	| YY MM DD hh mm |
	YY := aDateAndTime year.
	MM := aDateAndTime monthAbbreviation.
	DD := aDateAndTime dayOfMonth asString.
	hh := aDateAndTime hours.
	mm := aDateAndTime minutes asString.
	^ aDateAndTime year = DateAndTime now year
		ifTrue: [DD, ' ', MM]
		ifFalse: [DD, ' ', MM, ' ', YY]