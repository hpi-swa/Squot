requests
initialPathRequestAnswer
	| prefix |
	prefix := SquotPathUtilities asString: self commonPathPrefix.
	prefix last = $/ ifTrue: [^ prefix].
	^ prefix, '/'