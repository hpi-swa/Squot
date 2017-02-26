accessing - multibyte support
basicNext: count
	^ self nextInto: ((isBinary ifTrue: ByteArray ifFalse: ByteString) new: count)
