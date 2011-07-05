converting
pathFromString: aString
	| class |
	class :=  ((aString at: 1) isLetter and: [(aString at: 2) = $:])
		ifTrue: [FSAbsolutePath]
		ifFalse: [FSRelativePath].
	^ class readFrom: aString readStream delimiter: self delimiter