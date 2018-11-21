creating new versions
addParentVersion: aVersion
	loadedHistorian version ifNil:
		["We are on a fresh branch, but we have just adopted a parent."
		loadedHistorian version: aVersion.
		^ self loadedVersion: aVersion].
	(self additionalParents includes: aVersion) ifFalse:
		[self additionalParents add: aVersion].