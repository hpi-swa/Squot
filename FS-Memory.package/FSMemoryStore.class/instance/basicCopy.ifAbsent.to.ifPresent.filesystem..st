private
basicCopy: source ifAbsent: aBlock to: destination ifPresent: pBlock filesystem: aFilesystem
	self
		nodeAt: source
		ifPresent: [ :bytes | 
			(self basicIsFile: bytes)
				ifFalse: [ aBlock value ].
			self
				nodeAt: destination parent
				ifPresent: [ :dict | 
					(self basicIsDirectory: dict)
						ifFalse: [ self signalDirectoryDoesNotExist: destination parent ].
					(dict includesKey: destination basename)
						ifTrue: [ pBlock value ].
					dict at: destination basename put: bytes copy ]
				ifAbsent: [ self signalDirectoryDoesNotExist: destination parent ] ]
		ifAbsent: aBlock