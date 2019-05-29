ui menu
remotesPushSubMenu
	^ self remotesMenuWithItems:
		[:menu :remote |
		menu
			add: remote
			action: (MessageSend
				receiver: self
				selector: #actionPushToRemote:
				argument: remote)]