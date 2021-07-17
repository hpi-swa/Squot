as yet unclassified
buildCommitList: aBuilder

	^ aBuilder pluggableMultiColumnListSpec new
		model: self;
		list: #commitList;
		getIndex: #commitListIndex;
		hScrollBarPolicy: #whenNeeded;
		setIndex: #commitListIndex:;
		columnResizings: #(#shrinkWrap #shrinkWrap #shrinkWrap #spaceFill);
		itemAlignments: #(#right #left #left #left);
		frame: (LayoutFrame new
			leftFraction: 0.3 offset: 0;
			topFraction: 0 offset: 0;
			rightFraction: 1 offset: 0;
			bottomFraction: 1 offset: self buttonHeight negated)