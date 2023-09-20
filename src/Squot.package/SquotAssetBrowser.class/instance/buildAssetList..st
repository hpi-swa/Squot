toolbuilder
buildAssetList: builder
	^ builder pluggableListSpec new
		model: self;
		list: #assetList;
		getSelected: #selectedAsset;
		setSelected: #selectedAsset:;
		yourself