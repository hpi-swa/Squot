enumerating versions
versionsUnsharedWith: aHistorianOrVersion
	"Answer all versions that are ancestors of the argument or me, but not of both.
	It is the symmetric difference of our ancestries.
	The answer includes both the argument and me."
	^ self repository historyWalkClass new
		nextPut: (self asSquotVersionIn: self repository);
		nextPut: (aHistorianOrVersion asSquotVersionIn: self repository);
		upToAnyOf: (self mergeBasesWith: aHistorianOrVersion)