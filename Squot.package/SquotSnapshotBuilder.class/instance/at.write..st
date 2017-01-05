file access
at: aPath write: aBlock
	(self root resolve: aPath) writeStreamDo: aBlock