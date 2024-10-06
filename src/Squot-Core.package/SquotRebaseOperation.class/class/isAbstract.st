accessing
isAbstract
	^ self == SquotRebaseOperation or: [(self class includesSelector: #operationName) not]