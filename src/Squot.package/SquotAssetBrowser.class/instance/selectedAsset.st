accessing
selectedAsset
	^ self selectedMapper ifNotNil: [:mapper | SquotPathUtilities asString: mapper path]