toolbuilder
buildProjectPanel: builder
	| buttonBar projectPanel projectListSpec plusButton minusButton |
	projectPanel := builder pluggablePanelSpec new
		spacing: -1;
		children: OrderedCollection new;
		frame: (0@0.05 corner: 0.2@0.35)
		yourself.

	projectListSpec := builder pluggableListSpec new
		model: self;
		list: #projectList;
		getIndex: #projectIndex;
		setIndex: #projectIndex:;
		menu: #projectListMenu:;
		frame: (LayoutFrame new
			leftFraction: 0 offset: 0;
			topFraction: 0 offset: 0;
			rightFraction: 1 offset: 0;
			bottomFraction: 1 offset: -20).
	
	buttonBar := builder pluggablePanelSpec new
		layout: #horizontal;
		spacing: -1;
		children: OrderedCollection new;
		frame: (LayoutFrame new
			leftFraction: 0 offset: 0;
			topFraction: 1 offset: -20;
			rightFraction: 1 offset: 0;
			bottomFraction: 1 offset: 0).

	plusButton := builder pluggableActionButtonSpec new.
	plusButton
		model: self;
		label: '+';
		action: #actionProjectAdd;
		help: ''.

	minusButton := builder pluggableActionButtonSpec new.
	minusButton
		model: self;
		label: '-';
		action: #actionProjectRemove;
		help: ''.

	buttonBar children addAll: {plusButton. minusButton}.
	projectPanel children addAll: {projectListSpec. buttonBar}.
	^ projectPanel