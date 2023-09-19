menu
projectListMenu: aMenu
	aMenu
		target: SqueakWorkingCopy;
		add: 'new project' action: #newFromUserAndRegister;
		add: 'clone project' action: #cloneFromUserAndRegister.
	self addMappersProjectListMenu: aMenu.
	^ aMenu