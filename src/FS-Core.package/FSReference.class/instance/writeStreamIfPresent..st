streams
writeStreamIfPresent: presentBlock
	"If the file does not exist already, create the file and return an FSWriteStream on myself 
	If the files exists evaluate the presentBlock with no arguments"
	^ self isFile 
		ifTrue: [ presentBlock value ]
		ifFalse: [ self writeStream ]