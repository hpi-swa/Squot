Squot repository
defaultHistorian
	"Answer a canonical historian that should be at the tip version of my history."
	^ [historians at: 'master' ifAbsent: [self historians anyOne]]
		on: Error do: [:e | | newHistorian |
			newHistorian := self newHistorian: 'master' version: nil.
			e return: newHistorian]