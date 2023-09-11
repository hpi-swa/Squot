menu
addMenuItemsTo: aMenu
	aMenu target: self.
	self allIncluded ifFalse: [aMenu add: 'include all' action: #includeAll].
	self allExcluded ifFalse: [aMenu add: 'exclude all' action: #excludeAll].
	aMenu add: 'toggle excluded' action: #toggleExcluded.