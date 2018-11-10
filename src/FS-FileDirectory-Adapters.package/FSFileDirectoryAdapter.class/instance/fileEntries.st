enumeration
fileEntries
	^ reference files collect: [:each | self class on: each]