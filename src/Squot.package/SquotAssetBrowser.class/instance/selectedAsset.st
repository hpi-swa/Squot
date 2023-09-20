accessing
selectedAsset
	^ self selectedMapper ifNotNil: [:mapper | self pathToString: mapper path]