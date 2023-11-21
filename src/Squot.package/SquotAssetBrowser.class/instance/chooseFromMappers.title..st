importing
chooseFromMappers: aCollection title: aString
	^ UIManager default
		chooseFrom: (aCollection collect: #printStringWithoutPath)
		values: aCollection
		title: aString