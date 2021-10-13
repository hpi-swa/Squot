ui menu
swaMenuProjectListHook: aMenu
	<swaMenuProjectList>
	<menuPriority: 100>
	| submenu |
	self projectSelection
		ifNil: [submenu := aMenu]
		ifNotNil: [submenu := aMenu class new
					defaultTarget: aMenu defaultTarget;
					yourself].
	^ aMenu