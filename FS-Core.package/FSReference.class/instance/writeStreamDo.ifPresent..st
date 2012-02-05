streams
writeStreamDo: doBlock ifPresent: presentBlock
	"Return a write stream  if the file is not present and execute doBlock (with a stream) as argument, if the file is present execute the presentBlock (with not argument)."
	^ self isFile
		ifTrue: [ presentBlock value ]
		ifFalse: [ self writeStreamDo: doBlock ]