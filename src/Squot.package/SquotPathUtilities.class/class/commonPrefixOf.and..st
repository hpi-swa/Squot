common-prefix
commonPrefixOf: aPath and: anotherPath
	| segments |
	segments := OrderedCollection new.
	1 to: (aPath size min: anotherPath size) do: [:index |
		(aPath at: index) = (anotherPath at: index)
			ifTrue: [segments add: (aPath at: index)]
			ifFalse: [^ FSAbsolutePath withAll: segments]].
	^ SquotPathUtilities toAbsolutePath: aPath