streams
readStreamIfAbsent: absentBlock
	"Return a readstream on the receiver if it already exists or execute the absentBlock with no argument"
	^ self isFile
		ifTrue: [ self readStream ]
		ifFalse: [ absentBlock value ]