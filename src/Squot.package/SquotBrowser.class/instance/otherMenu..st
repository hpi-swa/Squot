menu
otherMenu: aMenuSpec
	aMenuSpec
		add: 'Self-update'
		target: self
		selector: #actionSelfUpdate
		argumentList: {};
		
		add: 'Force push'
		target: self
		selector: #actionForcePush
		argumentList: {}.