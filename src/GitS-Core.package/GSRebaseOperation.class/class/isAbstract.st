accessing
isAbstract
	^ self == GSRebaseOperation or: [(self class includesSelector: #operationName) not]