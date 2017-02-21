public-locations
baseDir
"Answers the reference to the actual repository location. If e.g. the repository was initialized with a reference to '/foo' but the repository were actually at '/foo/.git' then this method would answer a reference to '/foo/.git'".

	(reference isRoot not and: [reference basename endsWith: '.git'])
		ifTrue: [^reference]
		ifFalse: [^reference resolve: '.git']