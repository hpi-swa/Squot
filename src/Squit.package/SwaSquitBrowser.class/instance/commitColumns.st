toolbuilder
commitColumns

	| commits |
	commits := self commitList.
	^ {
		[:commit | self formatDate: commit timestamp].
		[:commit | String streamContents: [:s | commit timestamp printHMSOn: s]].
		[:commit | commit metadata at: #author].
		[:commit | (commit message lines ifNotEmptyDo: #first ifEmpty: '') truncateWithElipsisTo: 80]} withIndexCollect: [:columnBlock :columnIndex | commits collect: [:commit | columnBlock value: commit]]