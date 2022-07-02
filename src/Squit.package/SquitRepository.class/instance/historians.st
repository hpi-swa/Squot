Pur repository
historians
	"returns a collection of Historians"
	^ gitRepository branchNames collect: [:each |
		SquitHistorian
			existingNamed: each
			repository: self
			git: gitRepository repository]