compatibility
canChangeTo: aRebaseOperationClass
	^ (self wantsToChangeTo: aRebaseOperationClass) and: [aRebaseOperationClass wantsToBeCreatedFrom: self]