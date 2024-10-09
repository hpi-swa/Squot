toolbuilder
buildAssetSelectionPanel: builder
	^ GSGUIUtilities buildVerticalLayout: {
		self buildAssetList: builder.
		self buildSelectedAssetName: builder.
	} with: builder