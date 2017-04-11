ui toolbuilder
buildWith: builder
	| windowWidgets window |
	windowWidgets := self widgetSpecs: builder.
	window := builder pluggableWindowSpec new
		model: self;
		label: 'New version';
		children: windowWidgets;
		yourself.
	^ builder build: window