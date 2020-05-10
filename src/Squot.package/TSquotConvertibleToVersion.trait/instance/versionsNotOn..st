enumerating versions
versionsNotOn: aHistorianOrVersion
	"Answer all versions that are ancestors of me, but not of the argument.
	The answer includes me and does not include the argument."
	^ self repository historyWalkClass new
		nextPut: (self asSquotVersionIn: self repository);
		upTo: (aHistorianOrVersion asSquotVersionIn: self repository)