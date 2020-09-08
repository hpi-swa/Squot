tests
testAllDefinitionsHaveConsistentGrouping
	MCDefinition withAllSubclassesDo:
		[:definition | | shouldGroup sample |
		self assert: (definition canUnderstand: #squotShouldGroupByClass).
		shouldGroup := (sample := definition new) squotShouldGroupByClass.
		shouldGroup
			ifTrue: [self assert: (definition canUnderstand: #squotGroup)]
			ifFalse: [self deny: (definition canUnderstand: #squotGroup) "not strictly necessary, but nice to know dead code"]]