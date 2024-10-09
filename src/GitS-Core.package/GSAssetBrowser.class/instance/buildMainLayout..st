toolbuilder
buildMainLayout: builder
	^ GSGUIUtilities buildRow: {
		self buildProjectList: builder.
		self buildAssetSelectionPanel: builder.
		self buildDynamicAssetPanel: builder.
	} splits: {0.2. 0.6} with: builder