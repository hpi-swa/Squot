ui toolbuilder
buildWith: builder
	| windowWidgets acceptButton cancelButton window |
	windowWidgets := self widgetSpecs: builder.
	acceptButton := (SquotModalDialogWidgets acceptButton: builder)
		help: 'save the new version' translated;
		frame: (LayoutFrame new
			leftFraction: 0 offset: 0;
			topFraction: 1 offset: -25;
			rightFraction: 0.5 offset: 0;
			bottomFraction: 1 offset: 0);
		yourself.
	cancelButton := (SquotModalDialogWidgets cancelButton: builder)
		help: 'discard change selection and abort' translated;
		frame: (LayoutFrame new
			leftFraction: 0.5 offset: 0;
			topFraction: 1 offset: -25;
			rightFraction: 1 offset: 0;
			bottomFraction: 1 offset: 0);
		yourself.
	window := builder pluggableWindowSpec new
		model: self;
		label: 'New version';
		children: windowWidgets;
		yourself.
	^ builder build: window