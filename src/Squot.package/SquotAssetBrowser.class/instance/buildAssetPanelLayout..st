toolbuilder
buildAssetPanelLayout: builder
	^ SquotGUIUtilities buildVerticalSplit: 0.6
		of: (self buildAsset: builder)
		and: (self buildWorkspace: builder)
		with: builder