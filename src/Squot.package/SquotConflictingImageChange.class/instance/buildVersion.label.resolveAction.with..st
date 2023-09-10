toolbuilder
buildVersion: aForm label: aString resolveAction: aSelector with: builder
	^ builder pluggablePanelSpec new
		layout: #vertical;
		children: {
			self buildText: aString with: builder.
			self buildVersion: aForm with: builder.
			self buildResolveButton: aSelector with: builder.
		};
		frame: LayoutFrame fullFrame;
		yourself
	