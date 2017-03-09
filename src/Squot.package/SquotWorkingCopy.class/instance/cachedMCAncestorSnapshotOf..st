private creating new versions
cachedMCAncestorSnapshotOf: aMCWorkingCopy
	aMCWorkingCopy ancestors ifEmpty: [^ MCSnapshot empty].
	^ ((MCCacheRepository default
		versionWithInfo: aMCWorkingCopy ancestors first)
		ifNil: [^ MCSnapshot empty]) snapshot