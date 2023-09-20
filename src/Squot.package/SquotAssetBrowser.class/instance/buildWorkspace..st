toolbuilder
buildWorkspace: builder
	^ SquotAssetWorkspace
		model: self
		mapper: self selectedMapper
		setVersion: #version:
		getBindings: #workspaceBindings
		editTargetName: 'the asset'
		buildWith: builder