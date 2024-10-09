toolbuilder
buildWorkspace: builder
	^ GSAssetWorkspace
		model: self
		mapper: self selectedMapper
		setAsset: #asset:
		getBindings: #workspaceBindings
		editTargetName: 'the asset'
		buildWith: builder