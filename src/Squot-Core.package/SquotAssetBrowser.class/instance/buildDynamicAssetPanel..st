toolbuilder
buildDynamicAssetPanel: builder
	^ SquotDynamicallyBuilt
		model: self
		child: #buildAssetPanel:
		buildWith: builder