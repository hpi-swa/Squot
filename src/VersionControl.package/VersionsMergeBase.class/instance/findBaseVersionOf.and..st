as yet unclassified
findBaseVersionOf: version1 and: version2
	"Perform a breadth first search from the two versions,
	answer the first version that is reachable from both versions."
	| next visited paths |
	(version1 isNil or: [version2 isNil]) ifTrue: [^ nil].
	inputVersions := {version1. version2}.
	next := OrderedCollection withAll: inputVersions.
	paths := GraphPathCollection new.
	next do: [:each | paths addTarget: each].
	visited := Set new.
	[next notEmpty] whileTrue:
		[ | current |
		current := next removeFirst.
		((paths hasPathFrom: current to: version1) and: (paths hasPathFrom: current to: version2))
			ifTrue: [^ baseVersion := current].
		(visited includes: current) ifFalse:
			[current parents
				do: [:eachParent | next add: eachParent.
					paths addEdgeFrom: eachParent to: current].
			visited add: current]].
	^ nil "no common ancestor"
