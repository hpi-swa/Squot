comparing
= anObject
	anObject == self ifTrue: [^ true].
	^ ((anObject isMemberOf: self class)
			and: [anObject privateEquals: {object. path. storeInfo. store}])
		or: [(anObject respondsTo: #isLoaded) and: [self = anObject artifact]]