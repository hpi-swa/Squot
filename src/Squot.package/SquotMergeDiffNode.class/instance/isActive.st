testing
isActive
	^ choice
		ifNil: [self error: 'Conflict not yet resolved']
		ifNotNil: [choice == #right]