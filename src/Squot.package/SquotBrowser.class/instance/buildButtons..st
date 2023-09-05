toolbuilder
buildButtons: builder
	^ builder pluggablePanelSpec new
		layout: #horizontal;
		children: {
			self buildCommitButton: builder.
		};
		frame: LayoutFrame fullFrame;
		yourself