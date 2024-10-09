running
continue
	| result |
	result := self continueBlock value.
	self
		continueBlock: nil;
		handleDelayedOperationResult: result.