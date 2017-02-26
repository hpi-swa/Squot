streams
readStreamIfAbsent: absentBlock
	"If the file exists already return a FSReadStream on the receiver.
	If the files does not exist execute the absentBlock with no arguments"
	^ self isFile
		ifTrue: [ self readStream ]
		ifFalse: [ absentBlock value ]