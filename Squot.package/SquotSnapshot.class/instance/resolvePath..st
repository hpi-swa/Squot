FileSystem
resolvePath: aPath
	^ self artifactAt: (aPath printWithDelimiter: $/)