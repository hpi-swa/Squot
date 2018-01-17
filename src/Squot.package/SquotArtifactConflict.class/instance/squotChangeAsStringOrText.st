converting
squotChangeAsStringOrText
	^ (Text string: 'one side: ' attribute: TextEmphasis bold)
		append: left squotChangeAsStringOrText;
		append: String cr;
		append: (Text string: 'other side: ' attribute: TextEmphasis bold);
		append: right squotChangeAsStringOrText