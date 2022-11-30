private switching historians
mergeTemporaryVersionsOn: aHistorian
	| stashHistorian |
	(self repository hasTemporaryVersionsOn: aHistorian) ifFalse: [^ self].
	SquotProgress displayStatus: 'Merging stashed changes of ', aHistorian shortName during:
		[stashHistorian := self repository historianForTemporaryVersionsOn: aHistorian.
		self cherryPickTemporaryVersion: stashHistorian version].