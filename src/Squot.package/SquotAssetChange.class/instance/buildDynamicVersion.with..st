toolbuilder
buildDynamicVersion: aSelector with: builder
	^ SquotDynamicallyBuilt
		model: self
		child: aSelector
		buildWith: builder