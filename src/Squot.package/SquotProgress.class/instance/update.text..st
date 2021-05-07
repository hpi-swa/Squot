updating
update: aNumber text: aString
	(self outputOr: [^ self])
		updateProgress: aNumber
		text: aString.