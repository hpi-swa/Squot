public-accessing
nearestMergeBaseWithAnyOf: aCollectionOfHashes
	"Perform a breadth first search from me and the other commits,
	answer the first commit that is reachable from me and any of the other commits."
	| next otherEnds visited paths |
	next := OrderedCollection withAll:
		(aCollectionOfHashes collect: [:each | repository objectNamed: each ifAbsent: []]).
	next removeAllSuchThat: [:each | each isNil].
	otherEnds := Array withAll: next.
	next addLast: self.
	paths := GitGraphPathDictionary new.
	next do: [:each | paths addTarget: each].
	visited := Set new.
	[next notEmpty] whileTrue:
		[ | current |
		current := next removeFirst.
		((paths hasPathFrom: current to: self) and: (paths hasPathFrom: current toAnyOf: otherEnds))
			ifTrue: [^ current].
		(visited includes: current) ifFalse:
			[current parents
				do: [:each | next add: each.
					paths add: each asParentOf: current].
			visited add: current]].
	^ nil "no common ancestor"