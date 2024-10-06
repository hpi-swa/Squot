accessing
encoding: anObject
	(self class validEncodings includes: anObject) ifFalse: [
		^ self error: ('invalid encoding ''{1}''' format: {anObject})].
	encoding := anObject