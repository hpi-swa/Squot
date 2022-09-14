toolbuilder
buildButtons: builder

	^ builder pluggablePanelSpec new
		layout: #vertical;
		frame: (LayoutFrame fractions: (0.5 @ 0 corner: 0.5 @ 1) offsets: (self buttonWidth / -2 @ 0 corner: self buttonWidth / 2 @ 0));
		children: {
			builder pluggableActionButtonSpec new
				model: self;
				label: '>';
				enabled: #hasUntrackedSelections;
				action: #trackSelected;
				help: 'Start tracking the selected package'.
			
			builder pluggableActionButtonSpec new
				model: self;
				label: '<';
				enabled: #hasTrackedSelections;
				action: #untrackSelected;
				help: 'Stop tracking the selected package'}