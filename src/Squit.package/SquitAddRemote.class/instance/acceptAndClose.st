actions
acceptAndClose
	self validate ifFalse: [^ self informAboutInvalidValues].
	self accept;
		changed: #close.