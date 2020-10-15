ui
windowIsClosing
	self whileCancellingDo: [self updateMessageFromViews].