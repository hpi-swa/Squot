toolbuilder
buildDynamicAsset: aSelector with: builder
	^ GSDynamicallyBuilt
		model: self
		child: aSelector
		buildWith: builder