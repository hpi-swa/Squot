private
objectGraphs
	^ objectGraphs ifNil: [objectGraphs := WeakIdentityKeyDictionary new]