importing
importMapper: aMapper fromStream: aStream
	| version |
	version := aMapper readVersionFrom: aStream.
	self activeWorkingCopy addMapper: aMapper.
	aMapper materialize: version in: self activeWorkingCopy.
	self selectedMapper: aMapper.