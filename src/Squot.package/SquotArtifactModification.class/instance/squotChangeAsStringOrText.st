*Squot-Tools
squotChangeAsStringOrText
	^ ((self adornedDiffNodeTitle: left path), ': ', String cr, String cr) asText allBold;
		append: diffContent squotChangeAsStringOrText