accessing
selectedAsset
	^ self selectedMapper ifNotNil: [:mapper | GSPathUtilities asString: mapper path]