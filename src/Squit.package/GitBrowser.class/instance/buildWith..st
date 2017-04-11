toolbuilder
buildWith: builder
	| window commitTreeSpec summarySpec |
	window := builder pluggableWindowSpec new
		model: self;
		label: 'Git Browser';
		children: OrderedCollection new.

	commitTreeSpec := builder pluggableTreeSpec new
		model: self;
		roots: #commitList;
		getSelected: #commitSelection;
		setSelected: #commitSelection:;
		menu: #commitListMenu:;
		columns: {
				[:listMorph | (listMorph filteredItems collect: [:item |
					item preferredWidthOfColumn: 1]) max].
				[:listMorph | (listMorph filteredItems collect: [:item |
					item preferredWidthOfColumn: 2]) max].
				nil "take all the space"};
		frame: (0.2@0.05 corner: 1@0.65).

	summarySpec := builder pluggableTextSpec new
		model: self;
		getText: #contents;
		readOnly: true;
		menu: #codePaneMenu:shifted:;
		frame: (0@0.65 corner: 0.7@1).

	window children addAll: {
		self buildButtonBar: builder.
		self buildProjectPanel: builder.
		self buildBranchPanel: builder.
		commitTreeSpec.
		summarySpec.
		self buildObjectPanel: builder.}.
	^ builder build: window