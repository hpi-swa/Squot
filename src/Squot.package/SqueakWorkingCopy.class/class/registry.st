accessing
registry
	^ registry ifNil: [self registry: Dictionary new. registry]