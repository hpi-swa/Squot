ui toolbuilder
buildWith: builder
	| window windowWidgets |
	windowWidgets := self widgetSpecs: builder.
	window := builder pluggableWindowSpec new.
	window model: self;
		label: self windowLabel;
		children: windowWidgets.
	^ builder build: window