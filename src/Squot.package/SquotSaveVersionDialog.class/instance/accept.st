actions
accept
	self updateMessageFromViews.
	(self messageWasChanged not
			and: [(self confirm: 'Do you really want to commit without a proper commit message?') not])
		ifTrue: [^ self].
	super accept.