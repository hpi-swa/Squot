legacy
serializeDefinitions: aCollection
	^ String streamContents: [ :s |
		(MCStWriter on: s)
			writeDefinitions: aCollection ]