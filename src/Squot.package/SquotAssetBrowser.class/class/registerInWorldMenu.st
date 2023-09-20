world menu
registerInWorldMenu
	(self environment valueOf: #TheWorldMenu) ifNotNil: [:worldMenu |
		worldMenu registerOpenCommand: {'Git Asset Browser'. {self. #open}}].