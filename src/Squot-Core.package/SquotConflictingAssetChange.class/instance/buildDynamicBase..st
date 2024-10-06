toolbuilder
buildDynamicBase: builder
	^ self
		buildDynamicAsset: #buildBase:
		label: 'Base:'
		resolveAction: #resolveToBase
		state: #isResolvedToBase
		with: builder