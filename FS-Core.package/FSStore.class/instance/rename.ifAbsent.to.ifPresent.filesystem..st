private
rename: sourcePath ifAbsent: aBlock to: destinationPath ifPresent: pBlock filesystem: anFSFilesystem

	| result |
	result := self rename: sourcePath as: destinationPath.
	result	ifNil: [
			(self exists: destinationPath) ifTrue: [ ^ pBlock value ].
			(self exists: sourcePath) ifFalse: [ ^ aBlock value ].
			self primitiveFailed ].
	^ self.