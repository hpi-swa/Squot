initialize-release
initialize
	super initialize.
	self onSave: [:source :requestor | self evaluate: source notifying: requestor].