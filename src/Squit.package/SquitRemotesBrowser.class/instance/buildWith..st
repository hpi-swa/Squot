toolbuilder
buildWith: toolBuilder
	^ toolBuilder build: (toolBuilder pluggableWindowSpec new
		model: self;
		label: #labelString;
		extent: 250@100 * RealEstateAgent scaleFactor;
		children: {
			toolBuilder pluggableListSpec new
				name: #remotesList;
				model: self;
				list: #remotesLabels;
				getSelected: #selectedRemoteName;
				setSelected: #selectedRemoteName:;
				frame: (LayoutFrame fractions: (0@0 corner: 1@1) offsets: (0@0 corner: 0@(self buttonHeight negated)));
				yourself.
			toolBuilder pluggableButtonSpec new
				name: #addRemote;
				model: self;
				label: 'Add remote';
				action: #addRemote;
				frame: (LayoutFrame fractions: (0@1 corner: 1/3@1) offsets: (0@(self buttonHeight negated) corner: 0@0));
				yourself.
			toolBuilder pluggableButtonSpec new
				name: #editSelectedRemote;
				model: self;
				label: 'Edit selected';
				enabled: #isAnyRemoteSelected;
				action: #editSelectedRemote;
				frame: (LayoutFrame fractions: (1/3@1 corner: 2/3@1) offsets: (0@(self buttonHeight negated) corner: 0@0));
				yourself.
			toolBuilder pluggableButtonSpec new
				name: #removeSelectedRemote;
				model: self;
				label: 'Remove selected';
				enabled: #isAnyRemoteSelected;
				action: #removeSelectedRemote;
				frame: (LayoutFrame fractions: (2/3@1 corner: 1@1) offsets: (0@(self buttonHeight negated) corner: 0@0));
				yourself.})