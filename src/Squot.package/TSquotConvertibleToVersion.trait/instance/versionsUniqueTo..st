enumerating versions
versionsUniqueTo: aHistorianOrVersion
	"Answer all versions that are ancestors of the argument, but not of me.
	The answer includes the argument and does not include me."
	^ self repository historyWalkClass new
		nextPut: (aHistorianOrVersion asSquotVersionIn: self repository);
		upTo: (self asSquotVersionIn: self repository)