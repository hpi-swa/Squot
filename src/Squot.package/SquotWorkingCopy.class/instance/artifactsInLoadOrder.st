accessing objects
artifactsInLoadOrder
	^ loadOrder collect: [:each | self artifactAt: each]