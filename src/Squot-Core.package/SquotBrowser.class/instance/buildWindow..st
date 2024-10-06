toolbuilder
buildWindow: builder
	^ builder pluggableWindowSpec new
		model: self;
		label: #windowTitle;
		children: (SquotGUIUtilities windowChild: (self buildLayout: builder));
		yourself