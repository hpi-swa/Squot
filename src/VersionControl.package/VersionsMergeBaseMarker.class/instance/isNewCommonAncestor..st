private
isNewCommonAncestor: aMarkedVersion
	^ (aMarkedVersion reachableFromOrigin)
		and: [(aMarkedVersion reachableFromOther)
		and: [aMarkedVersion reachableFromCommonAncestor not]]