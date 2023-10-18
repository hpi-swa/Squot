world menu
registerInWorldMenu
	(self environment valueOf: #TheWorldMenu) ifNotNil: [:worldMenu |
		worldMenu registerOpenCommand: (Array 
			with: 'Git [for experts]'
			with: (Array
				with: self
				with: #open))].