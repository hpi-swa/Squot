toolbuilder
buildWith: toolBuilder
	^ toolBuilder build: (toolBuilder pluggableWindowSpec new
		model: self;
		label: #labelString;
		children: {
			toolBuilder pluggableListSpec new
				name: #objectList;
				model: self;
				list: #objectLabels;
				getIndex: #selectedObjectIndex;
				setIndex: #selectedObjectIndex:;
				dragItem: #dragFromObjectList:;
				dropItem: #dropOnObjectList:at:;
				dropAccept: #wantsDropOnObjectList:dragTransferType:source:;
				frame: (LayoutFrame fractions: (0@0 corner: 1@1) offsets: (0@0 corner: 0@(self buttonHeight negated)));
				yourself.
			toolBuilder pluggablePanelSpec new
				layout: #horizontal;
				frame: (LayoutFrame fractions: (0@1 corner: 1@1) offsets: (0@self buttonHeight negated corner: 0@0));
				children:
					{toolBuilder pluggableButtonSpec new
						name: #moveUpInLoadOrder;
						model: self;
						label: 'Move up';
						action: #moveUpInLoadOrder;
						yourself.
					toolBuilder pluggableButtonSpec new
						name: #moveDownInLoadOrder;
						model: self;
						label: 'Move down';
						action: #moveDownInLoadOrder;
						yourself.};
				yourself.})