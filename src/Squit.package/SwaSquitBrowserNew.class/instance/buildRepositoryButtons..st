as yet unclassified
buildRepositoryButtons: aBuilder

	^ aBuilder pluggablePanelSpec new
		layout: #horizontal;
		children: {
			aBuilder pluggableButtonSpec new
				model: self;
				label: 'Load';
				action: #actionLoad.
			aBuilder pluggableButtonSpec new
				model: self;
				label: 'Save';
				action: #actionSave.
			aBuilder pluggableButtonSpec new
				model: self;
				label: 'Save unpushed';
				action: #actionSaveUnpushed;
				enabled: false};
		frame: (LayoutFrame new
			leftFraction: 0.5 offset: 0;
			topFraction: 1 offset: self buttonHeight negated;
			rightFraction: 1 offset: 0;
			bottomFraction: 1 offset: 0)