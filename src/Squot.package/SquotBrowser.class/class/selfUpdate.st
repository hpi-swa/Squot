self-update
selfUpdate
	Metacello new
		baseline: 'Squot';
		repository: 'github://hpi-swa/Squot:mapper/src';
		get; load.
	self doPostUpdateMigrations.