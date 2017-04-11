Pur repository
historians
	"returns a collection of Historians"
	^ gitRepository branchNames collect: [:each |
		SquitHistorian new
			repository: self;
			gitRepository: gitRepository repository;
			name: each;
			yourself]