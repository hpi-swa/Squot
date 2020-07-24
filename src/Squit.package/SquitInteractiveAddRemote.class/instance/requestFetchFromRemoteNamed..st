fetching
requestFetchFromRemoteNamed: aString
	| p |
	p := Promise new.
	Project current addDeferredUIMessage:
		[(self confirm: 'Do you want to fetch from remote ', aString, ' now?')
			ifTrue: [p resolveWith: true]
			ifFalse: [p rejectWith: false]].
	^ p