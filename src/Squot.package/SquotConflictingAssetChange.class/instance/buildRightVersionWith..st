toolbuilder
buildRightVersionWith: builder
	^ self
		buildDynamicVersion: #buildRight:
		label: 'Incoming:'
		resolveAction: #resolveToRight
		state: #isResolvedToRight
		with: builder