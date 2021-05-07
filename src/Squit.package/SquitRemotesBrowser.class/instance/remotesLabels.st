accessing
remotesLabels
	^ self withUnitOfWork: [self gitRepository remoteNames sorted]