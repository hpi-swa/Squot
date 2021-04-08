capturing
capture: singleton with: aSquotObjectCapturer
	self flag: #todo. "Check whether immediate objects and global singletons such as true, false, nil should not just stand in for themselves instead of wrapping them."
	^ SquotPrimitiveValue for: singleton