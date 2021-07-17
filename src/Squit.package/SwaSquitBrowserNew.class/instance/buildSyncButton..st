as yet unclassified
buildSyncButton: aBuilder

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: 'Add Sync';
		action: #addRepository;
		frame: (LayoutFrame new
			leftFraction: 0 offset: 0;
			topFraction: 1 offset: self buttonHeight negated;
			rightFraction: 0.3 offset: 0;
			bottomFraction: 1 offset: 0)