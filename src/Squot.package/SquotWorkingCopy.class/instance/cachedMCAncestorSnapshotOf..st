private creating new versions
cachedMCAncestorSnapshotOf: aMCWorkingCopy
	aMCWorkingCopy ancestors ifEmpty: [^ MCSnapshot empty].
	^ ((aMCWorkingCopy repositoryGroup
		versionWithInfo: aMCWorkingCopy ancestors first)
		ifNil: [^ MCSnapshot empty]) addToCache; snapshot