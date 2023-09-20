toolbuilder
buildResolutionPanel: builder
	^ SquotGUIUtilities buildVerticalSplit: 0.6
		of: (self
				buildDynamicVersion: #buildResolution:
				label: 'Resolution:'
				resolveAction: nil
				with: builder)
		and: (self buildWorkspace: builder)
		with: builder