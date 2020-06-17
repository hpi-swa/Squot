private
fetchFrom: aRepository remoteNames: aCollection
	^ (SquitInteractiveFetch
		repository: aRepository
		remoteNames: aCollection)
		run
			then: [:ignored | self refresh]