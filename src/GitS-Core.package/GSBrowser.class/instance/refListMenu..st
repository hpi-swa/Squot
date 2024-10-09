menu
refListMenu: aMenu
	self activeRef ifNotNil: [self menu: aMenu forRef: self activeRef].
	aMenu
		target: self;
		addLine;

		add: 'Refresh refs'
		action: #actionRefreshRefTree.
	
	^ aMenu