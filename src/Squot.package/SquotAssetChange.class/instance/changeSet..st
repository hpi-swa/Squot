accessing
changeSet: aChangeSet
	self changeSet ifNotNil: [self changeSet removeDependent: self].
	super changeSet: aChangeSet.
	self changeSet addDependent: self.