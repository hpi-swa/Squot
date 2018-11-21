world menu
registerInWorldMenu
	(self environment valueOf: #TheWorldMenu) ifNotNil: [:worldMenu |
		worldMenu registerOpenCommand: (Array 
			with: 'Git Browser' 
			with: (Array
				with: self
				with: #open))].