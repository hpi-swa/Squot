asset-creation
assetAsAssetFile: anAsset
	anAsset ifNil: [^ nil].
	^ SquotAssetFile withMapper: self asset: anAsset