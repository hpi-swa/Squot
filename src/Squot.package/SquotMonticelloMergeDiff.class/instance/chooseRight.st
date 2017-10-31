resolving conflicts
chooseRight
	operations := operations, (conflicts collect: [:each | each operation]).
	conflicts := #().