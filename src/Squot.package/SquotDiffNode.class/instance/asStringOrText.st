as yet unclassified
asStringOrText
	^ content
		ifNil: [self hasChildren ifFalse: [^ ''].
			(Text fromString: self title, String cr, String cr) allBold, self concatenatedChildrenTexts]
		ifNotNil: [content squotChangeAsStringOrText]