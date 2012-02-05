streams
readStreamDo: doBlock ifAbsent: absentBlock
	"Return a read stream if the file is present and execute doBlock (with a stream) as argument, if the file is absent execute the absentBlock (with not argument)."
	^ self isFile 
		ifTrue: [ self readStreamDo: doBlock ]
		ifFalse: [ absentBlock value ]