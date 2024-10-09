toolbuilder
buildResolutionPanel: builder
	^ GSGUIUtilities buildVerticalSplit: 0.6
		of: (self
				buildDynamicAsset: #buildResolution:
				label: 'Resolution:'
				resolveAction: nil
				state: nil
				with: builder)
		and: (self buildWorkspace: builder)
		with: builder