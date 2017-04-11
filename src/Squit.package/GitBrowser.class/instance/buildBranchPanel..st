toolbuilder
buildBranchPanel: builder
	| buttonBar branchPanel branchListSpec plusButton minusButton |
	branchPanel := builder pluggablePanelSpec new
		spacing: -1;
		children: OrderedCollection new;
		frame: (0@0.35 corner: 0.2@0.65)
		yourself.

	branchListSpec := builder pluggableListSpec new
		model: self;
		list: #branchList;
		getIndex: #branchIndex;
		setIndex: #branchIndex:;
		menu: #fieldListMenu:;
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
		action: #actionBranchAdd;
		help: ''.

	minusButton := builder pluggableActionButtonSpec new.
	minusButton
		model: self;
		label: '-';
		action: #actionBranchRemove;
		help: ''.

	buttonBar children addAll: {plusButton. minusButton}.
	branchPanel children addAll: {branchListSpec. buttonBar}.
	^ branchPanel