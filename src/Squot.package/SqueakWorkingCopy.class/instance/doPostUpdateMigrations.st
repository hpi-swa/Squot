migrations
doPostUpdateMigrations
	self mappers
		do: [:each | each doPostUpdateMigrationsIn: self]
		displayingProgress: ('Migrating project {1}' format: {self name printString}).
	self doImageHashMigration.