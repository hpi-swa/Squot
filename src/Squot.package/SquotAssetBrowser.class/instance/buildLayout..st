toolbuilder
buildLayout: builder
	^ SquotGUIUtilities buildRow: {
		self buildProjectList: builder.
		self buildAssetList: builder.
		self buildDynamicAssetPanel: builder.
	} splits: {0.2. 0.6} with: builder