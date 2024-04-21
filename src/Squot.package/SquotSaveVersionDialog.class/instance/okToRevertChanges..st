ui toolbuilder
okToRevertChanges: aspect

	aspect = #message: ifTrue: [self message: self defaultMessage].
	^ true