toolbuilder
buildLeftVersionWith: builder
	^ self
		buildDynamicVersion: #buildLeft:
		label: 'Current:'
		resolveAction: #resolveToLeft
		state: #isResolvedToLeft
		with: builder