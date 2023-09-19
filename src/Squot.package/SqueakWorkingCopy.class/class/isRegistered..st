registering
isRegistered: aWorkingCopy
	^ (self registry at: aWorkingCopy name ifAbsent: [^ false]) == aWorkingCopy