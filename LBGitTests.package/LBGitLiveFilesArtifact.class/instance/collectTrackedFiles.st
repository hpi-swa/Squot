as yet unclassified
collectTrackedFiles 
	self halt.
	"use flatten"
	self trackedFiles: 
	(((((((self rootDirectory children reject: [:each | each path segments last = '.git'])
		collect: [:each | each allFiles])
		inject: Set new into: [:set :each | set addAll: each. set])
		collect: [:each | each relativeTo: self rootDirectory])
		collect: [:each | each segments fold: [:all :eachSegment | all,'/',eachSegment]])
		reject: [:each | self isSquotFile: each])
		collect: [:each | each -> (LBGitFileMetadata new path: each)]) asDictionary