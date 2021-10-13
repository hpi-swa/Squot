initialization
initialize

	super initialize.
	
	self title: 'GitHub credentials requested' translated.
	self initializeTextPanes.

	self createAcceptButton
		action: [self accept].
	self createCancelButton
		action: [self closeDialog: nil].
		
	self preferredPosition: ActiveHand cursorPoint.
	self setDefaultParameters.