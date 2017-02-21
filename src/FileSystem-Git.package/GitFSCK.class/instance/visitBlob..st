visiting
visitBlob: aBlob
	(self isReachable: aBlob) ifTrue: [ ^ self].
	
	self 
		mark: aBlob;
		validate: aBlob