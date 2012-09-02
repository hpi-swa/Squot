comparing
hash
	self isLightWeightTag ifFalse: [ ^ super hash ].
	
	^ self name asByteArray asInteger bitXor: self object hash