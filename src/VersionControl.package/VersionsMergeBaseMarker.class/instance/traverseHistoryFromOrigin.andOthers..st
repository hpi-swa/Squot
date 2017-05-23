traversing history
traverseHistoryFromOrigin: aMarkedVersion andOthers: aCollection
	aMarkedVersion markReachableFromOrigin.
	aCollection do: [:each | each markReachableFromOther].
	self traverseMarkedVersions: {aMarkedVersion}, aCollection do: [:each |
		(self isNewCommonAncestor: each)
			ifTrue: [self rememberCommonAncestor: each.
				self enqueueParentsOf: each markedWith: #(reachableFromCommonAncestor)]
			ifFalse: [self enqueueParentsOf: each markedWith: #()]].