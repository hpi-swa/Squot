accessing
encoding: aString
	(self class validEncodings includes: aString) ifFalse: [
		^ self error: ('invalid encoding ''{1}''' format: {aString})].
	encoding := aString.