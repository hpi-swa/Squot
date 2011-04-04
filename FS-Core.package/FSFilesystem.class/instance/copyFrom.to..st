private
copyFrom: in to: destPath
	| buffer out |
	out := nil.
	(self exists: destPath)
		ifTrue: [ store signalFileExists: destPath ].
	^ [ 
	out := self writeStreamOn: destPath.
	buffer := ByteArray new: 1024.
	[ in atEnd ]
		whileFalse: [ 
			buffer := in nextInto: buffer.
			out nextPutAll: buffer ] ] ensure: [ out ifNotNil: [ out close ] ]