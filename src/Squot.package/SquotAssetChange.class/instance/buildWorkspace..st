toolbuilder
buildWorkspace: builder
	^ SquotAssetWorkspace
		model: self
		mapper: self mapper
		setVersion: #saveNewVersion:
		getBindings: #workspaceBindings
		editTargetName: self workspaceEditTargetString
		buildWith: builder