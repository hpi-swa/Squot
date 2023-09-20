toolbuilder
buildDynamicAssetPanel: builder
	^ SquotDynamicallyBuilt
		model: self
		child: #buildAsset:
		buildWith: builder