toolbuilder
buildDynamicRight: builder
	^ self
		buildDynamicAsset: #buildRight:
		label: 'Incoming:'
		resolveAction: #resolveToRight
		state: #isResolvedToRight
		with: builder