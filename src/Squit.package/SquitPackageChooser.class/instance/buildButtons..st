as yet unclassified
buildButtons: builder

	^ builder pluggablePanelSpec new
		layout: #vertical;
		frame: (0.4 @ 0 corner: 0.6 @ 1);
		children: {
			builder pluggableActionButtonSpec new
				model: self;
				label: '>';
				enabled: #hasUntrackedSelection;
				action: #trackSelected;
				help: 'Start tracking the selected package'.
			
			builder pluggableActionButtonSpec new
				model: self;
				label: '<';
				enabled: #hasTrackedSelection;
				action: #untrackSelected;
				help: 'Stop tracking the selected package'}