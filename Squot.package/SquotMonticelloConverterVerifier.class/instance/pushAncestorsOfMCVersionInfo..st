as yet unclassified
pushAncestorsOfMCVersionInfo: aMCVersionInfo
	pendingMCVersions
		addAll: (aMCVersionInfo ancestors
			gather: [:each | (monticelloRepository versionWithInfo: each)
					ifNil: ["skip it" missingMCVersions add: each.
						self pushAncestorsOfMCVersionInfo: each.
						Array empty]
					ifNotNil: [:it | Array with: it]])