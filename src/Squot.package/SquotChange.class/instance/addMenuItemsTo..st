menu
addMenuItemsTo: aMenu
	aMenu
		target: self;
		add: (self isExcluded ifTrue: ['include'] ifFalse: ['exclude']) action: #toggleExcluded.