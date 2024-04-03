converting
asRelativeString: aPathOrString
	| path |
	path := self asString: aPathOrString.
	[path beginsWith: '/'] whileTrue: [path := path allButFirst].
	^ path.