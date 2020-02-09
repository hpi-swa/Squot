caching
sortVersionsTopologically: aCollection
	| pendingChildren remaining |
	pendingChildren := Dictionary new. "commit -> number of children"
	"initialize number of children"
	aCollection do: [:each |
		each parents do: [:eachParent |
			pendingChildren at: eachParent
				put: (pendingChildren at: eachParent ifAbsent: [0]) + 1]].
	"consume list items when eligible"
	remaining := aCollection copy.
	^ OrderedCollection streamContents: [:newList |
		[remaining notEmpty] whileTrue:
			[| next |
			next := remaining detect: [:each | (pendingChildren at: each ifAbsent: [0]) = 0].
			remaining remove: next.
			next parents do: [:each |
				pendingChildren at: each put: (pendingChildren at: each) - 1]. 
			newList nextPut: next]]