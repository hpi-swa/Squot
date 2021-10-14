toolbuilder
buildRepositoryLabel: aBuilder

	^ aBuilder pluggableTextSpec new
		model: self;
		getText: #repositoryText;
		readOnly: true;
		indicateUnacceptedChanges: false;
		frame: (LayoutFrame new
			leftFraction: 0 offset: 0;
			topFraction: 0 offset: 0;
			rightFraction: 0.8 offset: 0;
			bottomFraction: 0 offset: self buttonHeight)