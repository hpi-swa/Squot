sar
addToSar: aSarBuilder
	aSarBuilder
		addPackage: self package
		at: (GSPathUtilities asString: self pathWithPackage).