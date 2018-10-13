ui
cancel
	self updateMessageFromViews.
	canceled := true.
	self topView ifNotNil: #delete.