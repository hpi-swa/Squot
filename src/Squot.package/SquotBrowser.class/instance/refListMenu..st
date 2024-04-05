menu
refListMenu: aMenu
	self activeRef ifNotNil: [self menu: aMenu forRef: self activeRef].
	aMenu
		target: self;
		addLine;

		add: 'Refresh refs'
		action: #actionRefreshRefList;

		add: (self showGitRefs ifTrue: ['<yes>'] ifFalse: ['<no>']), 'Show git refs'
		action: #toggleShowGitRefs.
	
	^ aMenu