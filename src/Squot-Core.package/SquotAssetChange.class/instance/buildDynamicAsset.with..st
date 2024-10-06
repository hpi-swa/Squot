toolbuilder
buildDynamicAsset: aSelector with: builder
	^ SquotDynamicallyBuilt
		model: self
		child: aSelector
		buildWith: builder