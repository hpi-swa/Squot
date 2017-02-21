Pur repository
newHistorian: name version: aVersion
	historians at: name ifPresent: [:it | Warning signal: 'Historian with the same name exists'].
	^ SquotInMemoryHistorian new
		repository: self;
		name: name;
		version: aVersion;
		in: [:historian | historians at: name put: historian];
		yourself