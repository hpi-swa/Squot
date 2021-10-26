world menu
registerInWorldMenu
	"self registerInWorldMenu"
	(self environment valueOf: #TheWorldMenu) ifNotNil: [:worldMenu |
		worldMenu registerOpenCommand: (Array 
			with: 'SWA Git Browser' 
			with: (Array
				with: self
				with: #open))].