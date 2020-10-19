private
privateResolvedPatch
	| paths resolvedIncoming |
	paths := OrderedCollection newFrom: working.
	containerModifications keysAndValuesDo: 
		[:each :what |
		what = #add ifTrue: [paths add: each beforeIndex: (incoming indexOf: each)].
		what = #remove ifTrue: [paths remove: each]].
	containerConflicts do:
		[:each | | index |
		index := working indexOf: each key.
		index ~= each resolution ifTrue:
			[paths remove: each key.
			paths add: each key beforeIndex: each resolution]].
	resolvedIncoming := incoming asOrderedCollection select: [:each | paths includes: each].
	containerConflicts do:
		[:each | | index |
		index := incoming indexOf: each key.
		index ~= each resolution ifTrue:
			[resolvedIncoming remove: each key.
			resolvedIncoming add: each key beforeIndex: each resolution]].
	^ self autoResolve: paths and: resolvedIncoming