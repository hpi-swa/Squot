private
autoResolve: aCollection and: anIncomingCollection
	"Resolve dependency changes and store result to be able to answer hasChanges later."
	"Assumption: aCollection is based on working, anIncomingCollection is based on incoming and addition order conflicts have already been resolved in both."
	| nodes edges index baseSubset output search visited inOutput |
	(aCollection hasEqualElements: anIncomingCollection) ifTrue: "Trivial case"
		[^ resolvedPatch := GenericDiff squotDiffClass new
			file1: working;
			file2: anIncomingCollection;
			diff].
	nodes := aCollection asArray.
	index := Dictionary new.
	nodes withIndexDo: [:each :i | index at: each put: i].
	edges := nodes collect: [:each | OrderedCollection new].
	aCollection withIndexDo:
		[:each :i |
		"add successors"
		aCollection from: i + 1 to: aCollection size do:
			[:successor | (edges at: (index at: each)) add: successor -> 1]].
	(anIncomingCollection intersection: aCollection) withIndexDo:
		[:each :i |
		"add or increase successors"
		anIncomingCollection from: i + 1 to: anIncomingCollection size do:
			[:successor | | assoc |
			assoc := (edges at: (index at: each)) detect: [:edge | edge key = successor] ifNone: [(edges at: (index at: each)) add: successor -> 0].
			assoc value: assoc value + 1]].
	baseSubset := base intersection: aCollection.
	baseSubset withIndexDo:
		[:each :i |
		"decrease successors"
		baseSubset from: i + 1 to: baseSubset size do:
			[:successor | | assoc |
			assoc := (edges at: (index at: each)) detect: [:edge | edge key = successor] ifNone: [].
			assoc ifNotNil:
				[assoc value = 1
					ifTrue: [(edges at: (index at: each)) remove: assoc]
					ifFalse: [assoc value: assoc value - 1]]]].
	"return topological order of nodes&edges"
	visited := nodes collect: [:each | false].
	output := OrderedCollection new.
	inOutput := nodes collect: [:each | false].
	search := OrderedCollection withAll: nodes.
	[search isEmpty] whileFalse:
		[ | current | current := search removeLast.
		(visited at: (index at: current))
			ifTrue:
				[(inOutput at: (index at: current)) ifFalse:
					[output add: current. "came back after the children".
					inOutput at: (index at: current) put: true]]
			ifFalse:
				[visited at: (index at: current) put: true.
				((edges at: (index at: current)) reject: [:each | visited at: (index at: each key)])
					ifEmpty: [search add: current "come back for output"]
					ifNotEmpty: [:new | search add: current; "come back later"
											addAll: (new collect: [:each | each key])]]].
	^ resolvedPatch := GenericDiff squotDiffClass new
			file1: working;
			file2: output reverseInPlace;
			diff