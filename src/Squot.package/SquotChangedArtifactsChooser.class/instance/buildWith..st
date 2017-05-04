ui toolbuilder
buildWith: builder
	| mainWidgets mainWidgetsPanel acceptButton cancelButton window |
	mainWidgets := self chooserWidgetSpecs: builder.
	acceptButton := builder pluggableButtonSpec new
		model: self;
		label: 'accept' translated;
		help: 'accept the selected changes' translated;
		action: #accept;
		yourself.
	cancelButton := builder pluggableButtonSpec new
		model: self;
		label: 'cancel' translated;
		help: 'discard selection and abort' translated;
		action: #cancel;
		yourself.
	mainWidgetsPanel := builder pluggablePanelSpec new
		children: mainWidgets;
		frame: (LayoutFrame
			fractions: (0@0 corner: 1@1)
			offsets: (0@0 corner: 0@ -25));
		yourself.
	acceptButton frame: (LayoutFrame new
		leftFraction: 0 offset: 0;
		topFraction: 1 offset: -25;
		rightFraction: 0.5 offset: 0;
		bottomFraction: 1 offset: 0).
	cancelButton frame: (LayoutFrame new
		leftFraction: 0.5 offset: 0;
		topFraction: 1 offset: -25;
		rightFraction: 1 offset: 0;
		bottomFraction: 1 offset: 0).
	window := builder pluggableWindowSpec new.
	window model: self;
		label: 'Changed Artifacts' ;
		children: {mainWidgetsPanel. acceptButton. cancelButton}.
	^ builder build: window