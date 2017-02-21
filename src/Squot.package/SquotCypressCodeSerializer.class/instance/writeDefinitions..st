private
writeDefinitions: aCollectionOfMCDefinitions
	definitions addAll: aCollectionOfMCDefinitions.
	cypressWriter writeDefinitions: definitions.