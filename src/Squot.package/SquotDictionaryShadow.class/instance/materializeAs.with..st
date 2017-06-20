as yet unclassified
materializeAs: aDictionary with: aMaterializer
	(slots at: #associations) do: [:each |
		 each materializeIn: aDictionary with: aMaterializer].
	^ aDictionary