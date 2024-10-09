migrations
doPostUpdateMigrations
	self
		importLegacyProjects;
		doPostUpdateMigrationsOnAllInstances;
		uninstallSquot.