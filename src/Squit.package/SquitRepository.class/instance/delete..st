Pur repository
delete: aHistorian
	self withUnitOfWork: [self gitRepository deleteRef: aHistorian name].