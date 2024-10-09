toolbuilder
buildDynamicAssetPanel: builder
	^ GSDynamicallyBuilt
		model: self
		child: #buildAssetPanel:
		buildWith: builder