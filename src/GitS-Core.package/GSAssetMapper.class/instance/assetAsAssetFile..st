asset-creation
assetAsAssetFile: anAsset
	anAsset ifNil: [^ nil].
	^ GSAssetFile withMapper: self asset: anAsset