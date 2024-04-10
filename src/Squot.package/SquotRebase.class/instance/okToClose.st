toolbuilder
okToClose
	^ self canAbort not or: [self confirmAbort]