private
loadObjectNamed: aHexHash
	objectStores do: [:each |
		(each objectNamed: aHexHash ifAbsent: []) ifNotNil: [:object | ^ object]].
	self errorObjectNotFound: aHexHash.