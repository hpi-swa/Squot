accessing objects
artifactsInLoadOrder
	^ self loadOrder collect: [:each | self artifactAt: each]