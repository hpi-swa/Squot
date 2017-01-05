as yet unclassified
write: anObject at: aPath
	self snapshotBuilder at: aPath write: [:stream |
		(self streamClass on: stream)
			nextPutObjOnly: anObject]