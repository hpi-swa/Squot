as yet unclassified
materializeAs: aDictionary with: aMaterializer
	(slots at: #associations) do: [:each |
		aDictionary add: (aMaterializer rematerialize: each)].
	^ aDictionary