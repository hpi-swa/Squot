importing
chooseFromMappers: aCollection title: aString
	^ UIManager default
		chooseFrom: (aCollection collect: [:each |
						String streamContents: [:stream | each printWithoutPathOn: stream]])
		values: aCollection
		title: aString