private
searchAndFollowOnce: value reachedVia: aReference
	self searchOnceFor: value
		ifNew: [:name | self addedObject: value withName: name reachedVia: aReference]
		ifFound: [:existing | self compareLater: existing with: value reachedVia: aReference].