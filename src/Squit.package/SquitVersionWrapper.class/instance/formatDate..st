printing
formatDate: aDateAndTime
	| YY MM DD hh mm |
	YY := aDateAndTime year asString last: 2.
	MM := aDateAndTime monthAbbreviation.
	DD := self makeTwoDigitString: aDateAndTime dayOfMonth.
	hh := self makeTwoDigitString: aDateAndTime hours.
	mm := self makeTwoDigitString: aDateAndTime minutes.
	^ DD, ' ', MM, ' ', hh, ':', mm, '  '