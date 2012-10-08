command
head
	^ self resolveRef: (self readFile: 'HEAD') contents asString