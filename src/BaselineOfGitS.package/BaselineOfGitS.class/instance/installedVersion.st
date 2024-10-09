accessing
installedVersion
	^ ((self project version spec repositorySpecs collect: #createRepository)
		detect: [:each | each projectPath = GSSelfUpdater fullRepositoryName])
		projectVersion