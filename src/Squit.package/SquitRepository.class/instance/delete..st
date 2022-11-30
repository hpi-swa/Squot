Pur repository
delete: aHistorian
	self withUnitOfWork: [self git deleteRef: aHistorian name].
	Project current addDeferredUIMessage: [self changed: #historians].