comparing
isComparableTo: aReflectedObject
	^ mirror = aReflectedObject mirror
		and: [mirror is: object comparableTo: aReflectedObject object]