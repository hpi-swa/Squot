private
marked: aVersion
	^ markedVersions at: aVersion ifAbsentPut: [MarkedVersionForMergeBase on: aVersion]