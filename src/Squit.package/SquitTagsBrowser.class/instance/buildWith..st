toolbuilder
buildWith: toolBuilder
	| window tagList buttonBar |
	tagList := toolBuilder pluggableListSpec new
		name: #tagList;
		model: self;
		list: #tagLabels;
		getSelected: #selectedTagName;
		setSelected: #selectedTagName:;
		frame: (LayoutFrame fractions: (0@0 corner: 1@1) offsets: (0@0 corner: 0@SquotGUI buttonBarHeight negated));
		yourself.
	buttonBar := toolBuilder pluggablePanelSpec new
		layout: #horizontal;
		frame: (LayoutFrame fractions: (0@1 corner: 1@1) offsets: (0@SquotGUI buttonBarHeight negated corner: 0@0));
		children:
			{toolBuilder pluggableButtonSpec new
				name: #showLog;
				model: self;
				label: 'Show log' translated;
				action: #showLogSelectedTag;
				yourself.
			toolBuilder pluggableButtonSpec new
				name: #pushTag;
				model: self;
				label: 'Push';
				action: #pushSelectedTag;
				yourself.
			toolBuilder pluggableButtonSpec new
				name: #deleteTag;
				model: self;
				label: 'Delete' translated;
				action: #deleteSelectedTag;
				yourself};
		yourself.
	window := toolBuilder pluggableWindowSpec new
		model: self;
		label: #labelString;
		extent: 150 * RealEstateAgent scaleFactor @ (SquotGUI listHeightFor: 10);
		children: {tagList. buttonBar};
		yourself.
	^ toolBuilder build: window