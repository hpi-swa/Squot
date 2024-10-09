accessing
text
	^ self isActive ifFalse: [self label] ifTrue: [GSTextUtilities bold: self label]