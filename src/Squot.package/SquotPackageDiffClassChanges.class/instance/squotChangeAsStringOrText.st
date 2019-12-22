converting
squotChangeAsStringOrText
	^ (Text fromString: diffTreeNode title, String cr, String cr) allBold,
		diffTreeNode concatenatedChildrenTexts