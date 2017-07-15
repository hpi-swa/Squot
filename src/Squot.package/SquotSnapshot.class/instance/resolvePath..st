FileSystem
resolvePath: aPath
	^ self artifactAt: (SquotPath fromPath: aPath)