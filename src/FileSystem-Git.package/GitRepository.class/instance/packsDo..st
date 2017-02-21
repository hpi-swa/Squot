enumerating
packsDo: aBlock		
	self packs do: [ :pack | aBlock value: pack ]