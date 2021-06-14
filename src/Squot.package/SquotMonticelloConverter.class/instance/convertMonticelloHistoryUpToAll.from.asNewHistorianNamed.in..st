converting history
convertMonticelloHistoryUpToAll: mcVersions from: aMCRepository asNewHistorianNamed: historianName in: aRepository

	| tmpHistorianNames |
	squotRepository := aRepository.
	monticelloRepository := aMCRepository.
	tmpHistorianNames := OrderedCollection new.
	
	SquotProgress display: [:mcVersion | 'Converting package ', mcVersion package name]
		for: mcVersions
		do: [:mcVersion | | tmpHistorianName |
			tmpHistorianName := 'squot-convert-' , historianName , '/' , mcVersion package name.
			tmpHistorianNames add: tmpHistorianName.
			self copy convertMonticelloHistoryUpTo: mcVersion from: aMCRepository asNewHistorianNamed: tmpHistorianName in: aRepository].
	tmpHistorianNames do: [:tmpHistorianName |
		self addTemporaryHistorian: (aRepository historianNamed: tmpHistorianName)].
	
	self notify: ('Please merge the following branches into {1} before proceeding:\\{2}' withCRs format: {historianName. tmpHistorianNames asCommaString}).
	
	self cleanUpTemporaryHistorians.