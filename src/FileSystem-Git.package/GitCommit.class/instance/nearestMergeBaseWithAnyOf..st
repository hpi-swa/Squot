public-accessing
nearestMergeBaseWithAnyOf: aCollectionOfHashes
	"Perform a breadth first search from me and the other commits,
	answer the first commit that is visited twice and has a path to me."
	| next visited pathToSelf |
	next := OrderedCollection withAll:
		(aCollectionOfHashes collect: [:each | repository objectNamed: each ifAbsent: []]).
	next removeAllSuchThat: [:each | each isNil].
	next addLast: self.
	pathToSelf := Dictionary new.
	pathToSelf at: self put: Array empty.
	visited := Set new.
	[next notEmpty] whileTrue:
		[ | current nextOnPathToSelf |
		current := next removeFirst.
		nextOnPathToSelf := pathToSelf at: current ifAbsent: [].
		(nextOnPathToSelf notNil and: [visited includes: current])
			ifTrue: [^ current].
		(visited includes: current) ifFalse:
			[current parents
				do: [:each | next add: each.
					nextOnPathToSelf ifNotNil: [pathToSelf at: each put: current]].
			visited add: current]].
	^ nil "no common ancestor"