converting
squotChangeAsStringOrText
	^ (Text fromString: 'Conflict: ') allBold
		append: working squotChangeAsStringOrText;
		append: (Text fromString: ' vs. ') allBold;
		append: incoming squotChangeAsStringOrText