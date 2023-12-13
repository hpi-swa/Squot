toolbuilder
buildBaseVersionWith: builder
	^ self
		buildDynamicVersion: #buildBase:
		label: 'Base:'
		resolveAction: #resolveToBase
		state: #isResolvedToBase
		with: builder