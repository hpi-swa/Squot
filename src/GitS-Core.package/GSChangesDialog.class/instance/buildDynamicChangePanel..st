toolbuilder
buildDynamicChangePanel: builder
	^ GSDynamicallyBuilt
		model: self
		child: #buildChange:
		buildWith: builder