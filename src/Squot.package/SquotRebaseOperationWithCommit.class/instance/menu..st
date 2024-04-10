menu
menu: aMenu
	super menu: aMenu.
	aMenu add: 'Commit' subMenu:
		(self browser menu: MenuMorph new forCommit: self commit).