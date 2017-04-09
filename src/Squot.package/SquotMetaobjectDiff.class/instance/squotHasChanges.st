testing
squotHasChanges
	^ changedInstVars notEmpty or: [changedVariablePart notNil and: [changedVariablePart notEmpty]]