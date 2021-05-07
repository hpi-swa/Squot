converting
squotChangeAsStringOrText
	^ (diffTreeNode title asText, String cr, String cr) allBold,
		diffTreeNode concatenatedChildrenTexts