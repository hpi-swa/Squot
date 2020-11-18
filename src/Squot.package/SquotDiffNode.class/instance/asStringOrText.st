as yet unclassified
asStringOrText
	^ content
		ifNil: [self hasChildren ifFalse: [^ ''].
			(self title asText, String cr, String cr) allBold, self concatenatedChildrenTexts]
		ifNotNil: [content squotChangeAsStringOrText]