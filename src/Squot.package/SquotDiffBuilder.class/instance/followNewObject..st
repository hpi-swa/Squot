private
followNewObject: rightShadow
	walk followReferencesOfNewObject: rightShadow do: 
		[:value :newPath | self searchAndFollowOnce: value reachedVia: newPath last].