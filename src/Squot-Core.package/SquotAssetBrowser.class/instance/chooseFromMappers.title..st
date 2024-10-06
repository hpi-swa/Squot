importing
chooseFromMappers: aCollection title: aString
	^ UIManager default
		chooseFrom: (aCollection collect: #printDescriptionStringWithoutPath)
		values: aCollection
		title: aString