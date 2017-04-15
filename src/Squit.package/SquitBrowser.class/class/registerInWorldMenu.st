class initialization
registerInWorldMenu
	self environment at: #TheWorldMenu ifPresent: [ :class |
		class registerOpenCommand: (Array 
			with: 'Git Browser' 
			with: (Array
				with: self
				with: #open)) ].