*Squot-Mapper-comparing
squotEqual: anObject
	self == anObject ifTrue: [^ true].
	anObject isForm ifFalse: [^ false].
	^ (self pixelCompare: (0@0 corner: self extent) with: anObject at: 0@0) = 0