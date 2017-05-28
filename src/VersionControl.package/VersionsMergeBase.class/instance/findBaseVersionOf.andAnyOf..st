computing merge base
findBaseVersionOf: originVersion andAnyOf: aCollection
	"Color versions reachable from either end,
	detect common ancestors and find one of the best
	(that is not an ancestor of another common ancestor)."
	| markedOrigin markedOthers |
	originVersion isNil ifTrue: [^ nil].
	markedOrigin := self marked: originVersion.
	markedOthers := aCollection collect: [:each | self marked: each].
	commonAncestors := self newMarker
		traverseHistoryFromOrigin: markedOrigin
		andOthers: markedOthers;
		commonAncestors.
	self removeCommonAncestorsReachableFromOtherCommonAncestors.
	^ (self commonAncestors ifEmpty: [^ nil]) anyOne