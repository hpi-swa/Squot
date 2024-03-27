enumerating
entriesWithHashValue: aNumber do: aBlock
	self bucketForHashValue: aNumber do: [:entry |
		entry hashValue = aNumber ifTrue: [aBlock value: entry]].