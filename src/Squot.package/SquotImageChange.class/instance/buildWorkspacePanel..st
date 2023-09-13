toolbuilder
buildWorkspacePanel: builder
	^ builder pluggablePanelSpec new
		children: {self buildWorkspace: builder};
		yourself