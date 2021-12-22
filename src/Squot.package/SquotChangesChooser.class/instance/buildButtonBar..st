ui toolbuilder
buildButtonBar: builder
	| buttonBar cancelButton acceptButton |
	buttonBar := builder pluggablePanelSpec new
		layout: #horizontal;
		"spacing: -1;"
		children: OrderedCollection new;
		frame: (LayoutFrame new leftFraction: 0 offset: 0;
					 topFraction: 1 offset: self buttonHeight negated;
					 rightFraction: 1 offset: 0;
					 bottomFraction: 1 offset: 0)
		yourself.
	acceptButton := builder pluggableButtonSpec new
		model: self;
		label: 'Accept' translated;
		help: 'accept the selected changes' translated;
		action: #accept;
		color: #acceptColor;
		yourself.
	cancelButton := builder pluggableButtonSpec new
		model: self;
		label: 'Cancel' translated;
		help: 'discard selection and abort' translated;
		action: #cancel;
		color: #cancelColor;
		yourself.
	buttonBar children addAll: {acceptButton. cancelButton}.
	^ buttonBar