toolbuilder
buildWindow: builder
	^ builder pluggableWindowSpec new
		model: self;
		children: (GSGUIUtilities windowChild: (self buildLayout: builder));
		label: #windowTitle;
		yourself