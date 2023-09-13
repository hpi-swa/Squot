toolbuilder
buildWorkspace: builder
	| workspace |
	workspace := SquotPluggableWorkspace new
					onSave: [:source :requestor |
								self evaluate: source
									in: workspace
									notifying: requestor];
					yourself.
	self setupWorkspace: workspace.
	^ workspace buildWith: builder