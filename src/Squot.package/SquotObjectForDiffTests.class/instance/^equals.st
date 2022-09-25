comparing
= other
	(other isMemberOf: self class) ifFalse: [^ false].
	^ self var1 = other var1 and: [self var2 = other var2]