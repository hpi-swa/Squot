converting history
convertMonticelloHistoryUpToAll: mcVersions from: aMCRepository asNewHistorianNamed: historianName in: aRepository

	| tmpHistorianNames versions workingCopy |
	squotRepository := aRepository.
	monticelloRepository := aMCRepository.
	tmpHistorianNames := OrderedCollection new.
	
	SquotProgress display: [:mcVersion | 'Converting package ', mcVersion package name]
		for: mcVersions
		do: [:mcVersion | | tmpHistorianName |
			tmpHistorianName := 'squot-convert-' , historianName , '/' , mcVersion package name.
			tmpHistorianNames add: tmpHistorianName.
			self convertMonticelloHistoryUpTo: mcVersion from: aMCRepository asNewHistorianNamed: tmpHistorianName in: aRepository].
	tmpHistorianNames do: [:tmpHistorianName |
		self addTemporaryHistorian: (aRepository historianNamed: tmpHistorianName)].
	
	workingCopy := squotRepository createWorkingCopy
		store: SquotImageStore new;
		yourself.
	versions := temporaryHistorians collect: #version.
	versions do: [:version |
		version artifacts keysAndValuesDo: [:key :artifact |
			key ifNotEmpty: [workingCopy add: artifact]]].
	workingCopy additionalParents: versions.
	squotRepository newHistorian: historianName version: (
		squotRepository createNewVersion: workingCopy snapshot with: [:version |
			version
				parents: versions;
				message: ('Merge versions using {1}' format: {self className});
				timestamp: TimeStamp now]).
	
	self cleanUpTemporaryHistorians.