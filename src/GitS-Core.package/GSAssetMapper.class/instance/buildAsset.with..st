toolbuilder
buildAsset: anAsset with: builder
	^ builder pluggableScrollPaneSpec new	
		morph: (self assetOrNilAsMorph: anAsset);
		padding: 5 px;
		minimumExtent: 100 @ 100;
		yourself