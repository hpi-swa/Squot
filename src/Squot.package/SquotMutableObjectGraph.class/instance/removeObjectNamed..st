removing
removeObjectNamed: name
	objectNames removeKey: (objects removeKey: name ifAbsent: []) ifAbsent: [].
	objectNames removeKey: (shadows removeKey: name ifAbsent: []) ifAbsent: [].