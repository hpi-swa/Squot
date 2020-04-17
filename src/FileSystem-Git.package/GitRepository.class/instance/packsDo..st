enumerating
packsDo: aBlock		
	self privateDeprecatedUseUnitOfWork.
	self packs do: [ :pack | aBlock value: pack ]