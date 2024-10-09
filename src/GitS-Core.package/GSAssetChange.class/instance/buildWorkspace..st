toolbuilder
buildWorkspace: builder
	^ GSAssetWorkspace
		model: self
		mapper: self mapper
		setAsset: #saveNewAsset:
		getBindings: #workspaceBindings
		editTargetName: self workspaceEditTargetString
		buildWith: builder