visiting
visitRepository: aRepository
	self
		visitCommit: aRepository head;
		visitCollection: aRepository tags;
		visitCollection: aRepository branches