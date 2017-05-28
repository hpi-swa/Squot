computing merge base
findBaseVersionOf: version1 and: version2
	(version1 isNil or: [version2 isNil]) ifTrue: [^ nil].
	^ self findBaseVersionOf: version1 andAnyOf: {version2}