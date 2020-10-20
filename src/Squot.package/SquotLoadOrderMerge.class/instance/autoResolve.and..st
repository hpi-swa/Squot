private
autoResolve: aCollection and: anIncomingCollection
	"Resolve dependency changes and store result to be able to answer hasChanges later."
	"Assumption: aCollection is based on working, anIncomingCollection is based on incoming and additions and removals have have already been applied to both."
	| nodes edges index baseSubset output search visited inOutput onPath |
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
	"Return topological order of nodes&edges, or find a cycle and turn it into a conflict."
	visited := nodes collect: [:each | false].
	output := OrderedCollection new.
	inOutput := nodes collect: [:each | false].
	onPath := nodes collect: [:each | false]. "for cycle detection"
	search := OrderedCollection withAll: nodes.
	[search isEmpty] whileFalse:
		[ | current | current := search removeLast.
		current == #output
			ifTrue:
				[current := search removeLast.
				output add: current. "came back after the children".
				inOutput at: (index at: current) put: true.
				onPath at: (index at: current) put: false]
			ifFalse: 
				[(inOutput at: (index at: current)) ifFalse:
					[visited at: (index at: current) put: true.
					(onPath at: (index at: current)) ifTrue:
						[ | cyclePath | cyclePath := OrderedCollection new.
						search overlappingPairsDo: [:a :b | b == #output ifTrue: [cyclePath add: a]].
						cyclePath add: cyclePath first.
						containerConflicts at: cyclePath put: SquotLoadOrderConflict new.
						^ nil "abort, no resolved patch"].
					(edges at: (index at: current))
						ifEmpty: [search add: current; add: #output "come back for output"]
						ifNotEmpty:
							[:new |
							onPath at: (index at: current) put: true.
							search add: current; add: #output; "come back later"
								addAll: (new collect: [:each | each key])]]]].
	^ resolvedPatch := GenericDiff squotDiffClass new
			file1: working;
			file2: output reverseInPlace;
			diff