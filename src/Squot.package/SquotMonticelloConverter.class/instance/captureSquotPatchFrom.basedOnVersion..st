private
captureSquotPatchFrom: aMCVersionInfo basedOnVersion: baseMCVersionInfo
	| mcVersion baseMcVersion snapshot |
	mcVersion := monticelloRepository versionWithInfo: aMCVersionInfo.
	mcVersion ifNil: [^ nil].
	baseMcVersion := self findAvailableBaseVersionWithInfo: baseMCVersionInfo.
	snapshot := self captureSquotSnapshotFrom: aMCVersionInfo.
	^ baseMcVersion
		ifNil: [snapshot patchRelativeToBase: SquotSnapshot empty]
		ifNotNil: [snapshot patchRelativeToBase: (self captureSquotSnapshotFrom: baseMcVersion info)]