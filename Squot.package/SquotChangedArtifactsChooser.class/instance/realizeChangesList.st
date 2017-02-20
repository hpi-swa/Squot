ui
realizeChangesList
	list := Array streamContents: [:stream |
		effective associationsDo: [:each | each value ~= (self originalOf: each value)
				ifTrue: [stream nextPut: each]]]