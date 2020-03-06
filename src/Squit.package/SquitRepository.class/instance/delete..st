Pur repository
delete: aHistorian
	self withUnitOfWork: [self git deleteRef: aHistorian name].