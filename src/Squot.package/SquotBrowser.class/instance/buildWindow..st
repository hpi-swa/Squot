toolbuilder
buildWindow: builder
	^ builder pluggableWindowSpec new
		model: self;
		label: #windowTitle;
		children: {self buildLayout: builder};
		yourself