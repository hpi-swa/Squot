converting
squotChangeAsStringOrText
	^ (Text fromString: 'change ', left path, ': ', String cr)
		append: diffContent squotChangeAsStringOrText