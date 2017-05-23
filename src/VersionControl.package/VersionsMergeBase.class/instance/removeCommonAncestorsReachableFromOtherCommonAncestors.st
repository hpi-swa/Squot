computing merge base
removeCommonAncestorsReachableFromOtherCommonAncestors
	commonAncestors := commonAncestors reject: [:each |
		each reachableFromCommonAncestor].