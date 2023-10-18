world menu
registerInWorldMenu
	(self environment valueOf: #TheWorldMenu) ifNotNil: [:worldMenu |
		worldMenu registerOpenCommand: {'Git Browser'. {self. #open}}].