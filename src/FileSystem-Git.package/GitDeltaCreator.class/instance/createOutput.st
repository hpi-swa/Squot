as yet unclassified
createOutput
	| initialSize |
	initialSize := 8192.
	(self hasMaxSize and: [initialSize >= self maxSize])
		ifTrue: [initialSize := self maxSize + self class maxOperationSize + 1].
	self output: (OrderedCollection new: initialSize).