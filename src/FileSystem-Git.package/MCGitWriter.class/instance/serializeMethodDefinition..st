serializing
serializeMethodDefinition: aMethodDefinition 
	^ String streamContents: [ :s |
		(MCStWriter on: s)
			writeDefinitions: {aMethodDefinition}]