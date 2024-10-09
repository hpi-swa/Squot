toolbuilder
buildSelectedAssetName: builder
	^ builder pluggableTextSpec new
		model: self;
		getText: #selectedAssetName;
		readOnly: true;
		verticalResizing: #shrinkWrap;
		yourself