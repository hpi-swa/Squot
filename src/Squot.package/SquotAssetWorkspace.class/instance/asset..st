accessing
asset: anAsset
	self setAssetSelector ifNil: [^ self].
	self model perform: self setAssetSelector with: anAsset.