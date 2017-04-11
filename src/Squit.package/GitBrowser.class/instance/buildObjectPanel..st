toolbuilder
buildObjectPanel: builder
	| objectPanel objectListSpec |
	objectPanel := builder pluggablePanelSpec new
		spacing: -1;
		children: OrderedCollection new;
		frame: (0.7@0.65 corner: 1@1)
		yourself.

	objectListSpec := builder pluggableListSpec new
		model: self;
		list: #objectList;
		getIndex: #objectIndex;
		setIndex: #objectIndex:;
		menu: #fieldListMenu:;
		frame: (LayoutFrame new
			leftFraction: 0 offset: 0;
			topFraction: 0 offset: 0;
			rightFraction: 1 offset: 0;
			bottomFraction: 1 offset: 0).

	objectPanel children addAll: {objectListSpec}.
	^ objectPanel