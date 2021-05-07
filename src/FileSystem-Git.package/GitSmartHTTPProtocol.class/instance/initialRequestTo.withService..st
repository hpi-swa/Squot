private
initialRequestTo: aUrl withService: aServiceName
	^ [self client httpGet: aUrl asString , '/info/refs?service=', aServiceName]
		on: WebAuthRequired do:
			[:signal |
			(credentials isNil and: [self requestCredentials])
				ifTrue: [signal username: credentials first password: credentials second]
				ifFalse: [signal pass]]