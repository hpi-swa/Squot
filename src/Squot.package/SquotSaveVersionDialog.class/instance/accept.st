ui
accept
	self updateMessageFromViews.
	(self message = self defaultMessage
			and: [(self confirm: 'Do you really want to commit without a proper commit message?') not])
		ifTrue: [^ self].
	canceled := false.
	self topView ifNotNil: #delete.