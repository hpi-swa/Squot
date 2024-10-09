toolbuilder
buildWindow: builder
	^ builder pluggableWindowSpec new
		model: self;
		label: #windowTitle;
		children: (GSGUIUtilities windowChild: (self buildLayout: builder));
		yourself