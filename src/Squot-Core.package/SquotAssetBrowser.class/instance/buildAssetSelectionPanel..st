toolbuilder
buildAssetSelectionPanel: builder
	^ SquotGUIUtilities buildVerticalLayout: {
		self buildAssetList: builder.
		self buildSelectedAssetName: builder.
	} with: builder