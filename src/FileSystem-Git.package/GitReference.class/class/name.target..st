instance creation
name: refName target: signature
	self validateReferenceName: refName.
	^ self key: refName value: signature