sar
addToSar: aSarBuilder
	aSarBuilder
		addPackage: self package
		at: (SquotPathUtilities asString: self pathWithPackage).