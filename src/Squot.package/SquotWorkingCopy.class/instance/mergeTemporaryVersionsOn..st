private switching historians
mergeTemporaryVersionsOn: aHistorian
	| stashHistorian |
	(self repository hasTemporaryVersionsOn: aHistorian) ifFalse: [^ self].
	stashHistorian := self repository historianForTemporaryVersionsOn: aHistorian.
	self cherryPickTemporaryVersion: stashHistorian version.