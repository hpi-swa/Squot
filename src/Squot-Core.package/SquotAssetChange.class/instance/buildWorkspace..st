toolbuilder
buildWorkspace: builder
	^ SquotAssetWorkspace
		model: self
		mapper: self mapper
		setAsset: #saveNewAsset:
		getBindings: #workspaceBindings
		editTargetName: self workspaceEditTargetString
		buildWith: builder