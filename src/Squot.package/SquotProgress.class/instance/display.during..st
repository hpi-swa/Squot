initialize-release
display: aString during: aBlock
	^ (self outputOr: [^ aBlock value: self])
		displayProgress: aString
		during: [aBlock value: self]