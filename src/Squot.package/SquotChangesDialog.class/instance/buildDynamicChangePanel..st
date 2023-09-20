toolbuilder
buildDynamicChangePanel: builder
	^ SquotDynamicallyBuilt
		model: self
		child: #buildChange:
		buildWith: builder