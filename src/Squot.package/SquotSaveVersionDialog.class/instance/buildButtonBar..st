ui toolbuilder
buildButtonBar: builder
	| buttonBar cancelButton commitButton |
	buttonBar := builder pluggablePanelSpec new
		layout: #horizontal;
		"spacing: -1;"
		children: OrderedCollection new;
		frame: (LayoutFrame new leftFraction: 0 offset: 0;
					 topFraction: 1 offset: -25;
					 rightFraction: 1 offset: 0;
					 bottomFraction: 1 offset: 0)
		yourself.
		
	cancelButton := builder pluggableButtonSpec new.
	cancelButton
		model: self;
		label: 'Cancel';
		action: #actionCancel.
		
	commitButton := builder pluggableButtonSpec new.
	commitButton
		model: self;
		label: 'Commit';
		action: #actionCommit.
	
	buttonBar children addAll: {cancelButton. commitButton}.
	^ buttonBar