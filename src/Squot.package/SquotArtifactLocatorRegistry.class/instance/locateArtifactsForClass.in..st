artifact locating
locateArtifactsForClass: aClass in: aDirectory
	^ locators gather: [:each | each locateArtifactsForClass: aClass in: aDirectory]