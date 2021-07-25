private
searchAndFollowOnce: value reachedVia: aReference
	self searchOnceFor: value
		ifNew: [:name | self addedObject: value withName: name reachedVia: aReference]
		ifFound: [:existing | walk addLeft: existing right: value reachedVia: aReference].