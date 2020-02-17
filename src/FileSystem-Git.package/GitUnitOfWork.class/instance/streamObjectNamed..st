accessing
streamObjectNamed: aHexHash
	self flag: #refactor. "methods should not return streams that keep files open"
	objectStores do: [:each |
		(each streamObjectNamed: aHexHash ifAbsent: []) ifNotNil: [:stream | ^ stream]].
	self errorObjectNotFound: aHexHash.