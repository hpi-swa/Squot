converting
squotChangeAsStringOrText
	^ (Text fromString: 'change ', left path, ': ', String cr, String cr) allBold;
		append: diffContent squotChangeAsStringOrText