sorting
topologicalOrderIfNone: aBlock
	| visited output inOutput onPath search |
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
						["Abort, no tological order because there is a cycle."
						| cyclePath | cyclePath := OrderedCollection new.
						search overlappingPairsDo: [:a :b | b == #output ifTrue: [cyclePath add: a]].
						cyclePath add: cyclePath first.
						^ aBlock cull: cyclePath].
					(edges at: (index at: current))
						ifEmpty: [search add: current; add: #output "come back for output"]
						ifNotEmpty:
							[:new |
							onPath at: (index at: current) put: true.
							search add: current; add: #output; "come back later"
								addAll: (new collect: [:each | each key])]]]].
	^ output reverseInPlace