migrations
doPostUpdateMigrations
	self mappers do: [:each | each doPostUpdateMigrationsIn: self].
	self doImageHashMigration.