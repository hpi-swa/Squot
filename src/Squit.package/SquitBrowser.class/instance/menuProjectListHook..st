ui menu
menuProjectListHook: aMenu
	<menuProjectList>
	<menuPriority: 100>
	| submenu |
	self projectSelection
		ifNil: [submenu := aMenu]
		ifNotNil: [submenu := aMenu class new
					defaultTarget: aMenu defaultTarget;
					yourself].
	submenu
		addList: {	
			{'Add new project'. #actionProjectAdd}.
			{'Clone project'. #actionProjectClone}.
		}.
	self projectSelection ifNotNil:
		[aMenu add: 'New project...' subMenu: submenu].
	^ aMenu