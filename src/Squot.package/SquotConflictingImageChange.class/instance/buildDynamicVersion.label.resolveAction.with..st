toolbuilder
buildDynamicVersion: aSelector label: aString resolveAction: anotherSelector with: builder
	^ builder pluggablePanelSpec new
		layout: #vertical;
		children: {
			self buildText: aString with: builder.
			self buildDynamicVersion: aSelector with: builder.
			self buildResolveButton: anotherSelector with: builder.
		};
		frame: LayoutFrame fullFrame;
		yourself