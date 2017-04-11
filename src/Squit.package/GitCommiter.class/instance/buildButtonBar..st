toolbuilder
buildButtonBar: builder
	| buttonBar cancelButton commitButton |
	buttonBar := builder pluggablePanelSpec new
		layout: #horizontal;
		"spacing: -1;"
		children: OrderedCollection new;
		frame: (0@0.9 corner: 1@1)
		yourself.
		
	cancelButton := builder pluggableButtonSpec new.
	cancelButton
		model: self;
		label: 'Cancel';
		action: #actionCancel;
		help: ''.
		
	commitButton := builder pluggableButtonSpec new.
	commitButton
		model: self;
		label: 'Commit';
		action: #actionCommit;
		help: ''.
	
	buttonBar children addAll: {cancelButton. commitButton}.
	^ buttonBar