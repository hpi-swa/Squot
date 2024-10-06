migrations
doPostUpdateMigrations
	self mappers
		do: [:each | each doPostUpdateMigrationsIn: self]
		displayingProgress: [:each | 'Migrating {1}' format: {each}].
	self doImageHashMigration.