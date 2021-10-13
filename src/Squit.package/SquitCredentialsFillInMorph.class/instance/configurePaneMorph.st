initialization
configurePaneMorph.

	"self paneMorph
		wantsPaneSplitters: true;
		addCornerGrips.
	self paneMorph grips do: [:ea | ea showHandle: true]."
	
	self paneMorph extent: (275@200).	