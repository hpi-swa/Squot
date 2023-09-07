toolbuilder
buildButtons: builder
	^ builder pluggablePanelSpec new
		layout: #horizontal;
		children: {
			self buildCancelButton: builder.
			self buildCommitButton: builder.
		};
		frame: LayoutFrame fullFrame;
		yourself