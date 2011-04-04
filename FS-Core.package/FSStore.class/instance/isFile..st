public
isFile: aPath
	^ self nodeAt: aPath ifPresent: [ :entry | ^ self basicIsFile: entry ] ifAbsent: [ ^ false ]