toolbuilder
buildAssetFile: anAssetFile with: builder
	^ self buildAsset: (anAssetFile ifNotNil: #asset) with: builder