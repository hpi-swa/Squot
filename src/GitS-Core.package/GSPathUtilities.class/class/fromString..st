converting
fromString: aString
	| delimiter withSameDelimiter |
	delimiter := self mainDelimiter.
	withSameDelimiter := aString.
	self otherDelimiters do: [:each |
		withSameDelimiter := withSameDelimiter
									copyReplaceAll: each asString
									with: delimiter asString].
	^ self toAbsolutePath: (FSPath from: withSameDelimiter delimiter: delimiter)