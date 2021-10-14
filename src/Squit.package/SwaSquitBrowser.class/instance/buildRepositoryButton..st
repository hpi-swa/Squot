toolbuilder
buildRepositoryButton: aBuilder

	^ aBuilder pluggableButtonSpec new
		model: self;
		label: #repositoryButtonText;
		action: #actionRepositoryButtonClicked;
		frame: (LayoutFrame new
			leftFraction: 0.8 offset: 0;
			topFraction: 0 offset: 0;
			rightFraction: 1 offset: 0;
			bottomFraction: 0 offset: self buttonHeight)