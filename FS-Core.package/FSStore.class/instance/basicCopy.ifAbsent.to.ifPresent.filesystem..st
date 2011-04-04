private
basicCopy: source ifAbsent: aBlock to: destination ifPresent: pBlock filesystem: aFilesystem
	| buffer out in |
	in := nil.
	out := nil.
	buffer := nil.
	[ 
	in := aFilesystem readStreamOn: source.
	in ifNil: [ aBlock value ].
	(self exists: destination)
		ifTrue: [ pBlock value ].
	out := aFilesystem writeStreamOn: destination.
	buffer := ByteArray new: 1024.
	[ in atEnd ]
		whileFalse: [ 
			buffer := in nextInto: buffer.
			out nextPutAll: buffer ] ]
		ensure: [ 
			in ifNotNil: [ in close ].
			out ifNotNil: [ out close ] ]