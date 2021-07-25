enumerating
newObjectsDo: newBlock existingObjectsPairsDo: compareBlock
	self do:
		[:leftShadow :rightShadow :leftReferrer :rightReferrer :path |
		leftShadow
			ifNil: [newBlock value: rightShadow value: rightReferrer value: path]
			ifNotNil: [compareBlock valueWithArguments: {leftShadow. rightShadow. leftReferrer. rightReferrer. path}]]