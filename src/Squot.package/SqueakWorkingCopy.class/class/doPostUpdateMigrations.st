migrations
doPostUpdateMigrations
	self allInstances do: #doPostUpdateMigrations displayingProgress: 'Migrating projects'.