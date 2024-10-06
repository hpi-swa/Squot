menu
addMappersProjectListMenu: aMenu
	SquotMapper allSubclassesDo: [:each |
		(each class includesSelector: #projectListMenu:for:) ifTrue: [
			each projectListMenu: aMenu for: self activeWorkingCopy]].