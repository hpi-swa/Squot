dependencies
classDependencies
	^ (({
		self.
		SquotPathUtilities.
		SquotAnimation.
		SquotPlaintext.
	}, SquotAssetMapper allSubclasses)
		gather: #withAllSuperclasses)
		asSet
		select: [:each | each package = self package]