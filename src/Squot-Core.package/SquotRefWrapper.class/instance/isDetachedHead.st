accessing
isDetachedHead
	^ self isHead and: [self workingCopy isHeadDetached]