migrations
doPostUpdateMigrations
	self allInstances
		do: #doPostUpdateMigrations
		displayingProgress: [:each | 'Migrating project {1}' format: {each name printString}].