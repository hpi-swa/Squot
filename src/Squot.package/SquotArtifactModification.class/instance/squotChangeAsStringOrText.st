*Squot-Tools
squotChangeAsStringOrText
	| text |
	text := ((self adornedDiffNodeTitle: left path), ': 

') asText allBold.
	(metadataDiff includesId and: [metadataDiff right includesKey: #id])
		ifTrue: [text append: 'Set id to '; append: (metadataDiff right at: #id) asString; append: '

'].
	text append: diffContent squotChangeAsStringOrText.
	^ text