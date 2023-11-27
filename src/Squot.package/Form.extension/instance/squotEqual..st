*Squot-Mapper-comparing
squotEqual: anObject
	self == anObject ifTrue: [^ true].
	anObject isForm ifFalse: [^ false].
	self extent = anObject extent ifFalse: [^ false].
	0 to: self width - 1 do: [:x |
		0 to: self height - 1 do: [:y | | point |
			point := x @ y.
			(self colorAt: point) = (anObject colorAt: point) ifFalse: [^ false]]].
	^ true