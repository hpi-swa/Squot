computing merge base
removeCommonAncestorsReachableFromOtherCommonAncestors
	| remainingAncestors |
	commonAncestors := commonAncestors reject: [:each |
		each reachableFromCommonAncestor].
	remainingAncestors := commonAncestors copy.
	remainingAncestors do: [:remainingAncestor |
		self removeCommonAncestorIfReachableFromOtherCommonAncestors:
			remainingAncestor].