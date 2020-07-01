fetching
requestFetchFromRemoteNamed: aString
	| p |
	p := Promise new.
	Project current addDeferredUIMessage:
		[(UIManager default confirm: 'Do you want to fetch from remote ', aString, ' now?')
			ifTrue: [p resolve]
			ifFalse: [p reject]].
	^ p