compressing
compress
	self compressChildren.
	self children ifEmpty: [^ nil].
	self children size = 1 ifTrue: [
		^ self children first
			prefixLabel: self label, $/;
			yourself].
	^ self