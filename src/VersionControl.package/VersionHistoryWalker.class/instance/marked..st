private
marked: aVersion
	^ markedVersions at: aVersion ifAbsentPut: [MarkedVersionForHistoryWalk on: aVersion]