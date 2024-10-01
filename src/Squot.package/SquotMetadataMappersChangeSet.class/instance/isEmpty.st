accessing
isEmpty
	^ self potentiallyRemovedMappers isEmpty
		and: [self oldMappers asSet = self allMappers asSet]