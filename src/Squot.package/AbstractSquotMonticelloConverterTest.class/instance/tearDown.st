running
tearDown

	[mcRepositories do: [:repo |
		self environment packageOrganizer packageNamed: repo description ifPresent: [:package |
			package workingCopy unregister].
		self environment packageOrganizer unregisterPackageNamed: repo description.
		MCRepositoryGroup default removeRepository: repo]]
			ensure: [super tearDown]