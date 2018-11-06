converting
squotChangeAsStringOrText
	^ (Text string: 'working copy: ' attribute: TextEmphasis bold)
		append: left squotChangeAsStringOrText;
		append: String cr;
		append: (Text string: 'other edition: ' attribute: TextEmphasis bold);
		append: right squotChangeAsStringOrText