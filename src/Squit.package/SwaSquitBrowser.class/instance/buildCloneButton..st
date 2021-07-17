toolbuilder
buildCloneButton: builder

	| buttonBar cloneButton |
	buttonBar := builder pluggablePanelSpec new
		layout: #horizontal;
		"spacing: -1;"
		children: OrderedCollection new;
		frame: (LayoutFrame new leftFraction: 0 offset: 0;
					 topFraction: 0 offset: 0;
					 rightFraction: 1 offset: 0;
					 bottomFraction: 0.1 offset: 0)
		yourself.

	cloneButton := builder pluggableActionButtonSpec new.
	cloneButton
		model: self;
		label: 'Clone';
		action: #actionProjectClone;
		help: 'Clone a new project.'.

	buttonBar children addAll: {cloneButton}.
	^ buttonBar