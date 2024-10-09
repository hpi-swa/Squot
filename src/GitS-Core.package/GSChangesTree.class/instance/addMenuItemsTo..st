menu
addMenuItemsTo: aMenu
	| allIncluded allExcluded |
	allIncluded := self allIncluded.
	allExcluded := self allExcluded.
	aMenu target: self.
	allIncluded ifFalse: [
		aMenu add: 'include all', (allExcluded ifTrue: [' (x)'] ifFalse: ['']) action: #includeAll].
	allExcluded ifFalse: [aMenu add: 'exclude all (x)' action: #excludeAll].
	aMenu add: 'toggle excluded' action: #toggleExcludedIndividual.