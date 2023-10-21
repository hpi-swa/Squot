testing
path: aPath collidesWith: anotherPath
	1 to: (aPath size min: anotherPath size) do: [:index |
		(aPath at: index) = (anotherPath at: index) ifFalse: [^ false]].
	^ true