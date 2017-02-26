streams
readStreamDo: doBlock ifAbsent: absentBlock
	"If the file is present and execute doBlock with a FSReadStream as argument.
	If the file is absent execute the absentBlock with no argument."
	^ self isFile 
		ifTrue: [ self readStreamDo: doBlock ]
		ifFalse: [ absentBlock value ]