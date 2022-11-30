*Squot-Tools
squotChangeAsStringOrText
	| text |
	text := ('Merge of ', self object path) asText allBold, '
	
'.
	((metadataMerge working includesKey: #id) not and: [metadataMerge incoming includesKey: #id])
		ifTrue: [text append: 'Set id to '; append: (metadataMerge incoming at: #id) asString; append: '

'].
	text append: graphMerge squotChangeAsStringOrText.
	^ text