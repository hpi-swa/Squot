printing
formatDate: aDateAndTime
	| YY MM DD hh mm |
	YY := aDateAndTime year.
	MM := aDateAndTime monthAbbreviation.
	DD := self makeTwoDigitString: aDateAndTime dayOfMonth.
	hh := self makeTwoDigitString: aDateAndTime hours.
	mm := self makeTwoDigitString: aDateAndTime minutes.
	^ aDateAndTime year = DateAndTime now year
		ifTrue: [DD, ' ', MM, ' ', hh, ':', mm, '  ']
		ifFalse: [DD, ' ', MM, ' ', YY]