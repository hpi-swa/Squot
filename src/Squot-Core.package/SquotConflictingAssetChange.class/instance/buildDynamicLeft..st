toolbuilder
buildDynamicLeft: builder
	^ self
		buildDynamicAsset: #buildLeft:
		label: 'Current:'
		resolveAction: #resolveToLeft
		state: #isResolvedToLeft
		with: builder