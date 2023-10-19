converting
fromString: aString
	| delimiter withSameDelimiter |
	delimiter := self delimiters first.
	withSameDelimiter := aString.
	self delimiters allButFirstDo: [:each |
		withSameDelimiter := withSameDelimiter
									copyReplaceAll: each asString
									with: delimiter asString].
	^ FSPath from: withSameDelimiter delimiter: delimiter