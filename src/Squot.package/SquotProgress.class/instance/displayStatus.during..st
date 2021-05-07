initialize-release
displayStatus: aString during: aBlock
	^ (self outputOr: [^ aBlock value])
		displayStatus: aString
		during: aBlock