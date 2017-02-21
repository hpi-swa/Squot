writing
writeDefinitions: definitions	
	definitions do: [ :each|
		self writeDefinition: each ].