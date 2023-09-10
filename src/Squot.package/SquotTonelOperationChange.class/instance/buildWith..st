toolbuilder
buildWith: builder
	^ builder pluggablePanelSpec new
		layout: #vertical;
		children: {
			self buildText: builder.
		}, (self isEditable ifTrue: [{
			self buildEditButton: builder.
		}] ifFalse: [{}]);
		frame: LayoutFrame fullFrame;
		yourself