streams
writeStreamIfPresent: presentBlock
	"Return a writestream on the receiver if it does not already exist or execute the presentBlock with no argument"
	^ self isFile 
		ifTrue: [ presentBlock value ]
		ifFalse: [ self writeStream ]