streams
writeStreamDo: doBlock ifPresent: presentBlock
	"If the file is not present, create the file and evaluate doBlock with an FSWriteStream as argument.
	 If the file is present evaluate the presentBlock with no arguments."
	^ self isFile
		ifTrue: [ presentBlock value ]
		ifFalse: [ self writeStreamDo: doBlock ]