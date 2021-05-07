fetching
fetch
	^ (SquitInteractiveFetch
		repository: repository
		remoteNames: {query remoteName})
		run
			then: [:x | promise resolveWith: query]
			ifRejected:
				[:x |
				self undo.
				self retry]