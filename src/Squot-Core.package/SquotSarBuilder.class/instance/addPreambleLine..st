adding
addPreambleLine: aString
	self preamble: self preamble, (self preamble ifNotEmpty: [String cr]), aString.