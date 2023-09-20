toolbuilder
buildWorkspace: builder
	^ SquotAssetWorkspace
		model: self
		mapper: self mapper
		setVersion: #versionToWrite:
		getBindings: #workspaceBindings
		editTargetName: self workspaceEditTargetString
		buildWith: builder