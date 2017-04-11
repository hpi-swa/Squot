toolbuilder
buildWith: builder
	| window changesListSpec changeViewSpec commitTextSpec |
	window := builder pluggableWindowSpec new
		model: self;
		label: 'Git Commit';
		children: OrderedCollection new.

	changesListSpec := builder pluggableListSpec new
		model: self;
		list: #dataChanges;
		getSelected: #commitSelection;
		setSelected: #commitSelection:;
		menu: #fieldListMenu:;
		frame: (0@0 corner: 0.3@0.7).

	changeViewSpec := builder pluggableTextSpec new
		model: self;
		getText: #changeContents; 
		setText: #changeContents:notifying:; 
		selection: #changeContentsSelection; 
		menu: #fieldListMenu:;
		frame: (0.3@0 corner: 1@0.7).

	commitTextSpec := builder pluggableTextSpec new
		model: self;
		getText: #contents;
		setText: #contents:notifying:; 
		selection: #contentsSelection; 
		menu: #codePaneMenu:shifted:;
		frame: (0@0.7 corner: 1@0.9).

	window children addAll: {changesListSpec. changeViewSpec. commitTextSpec. self buildButtonBar: builder.}.
	^ builder build: window