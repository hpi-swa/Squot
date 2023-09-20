accessing
selectedMapper: anAssetMapper
	selectedMapper := anAssetMapper.
	self
		changed: #selectedAsset;
		changed: #selectedAssetName;
		changed: #buildAssetPanel:.