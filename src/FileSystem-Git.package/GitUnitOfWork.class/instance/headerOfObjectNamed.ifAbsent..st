objects-private
headerOfObjectNamed: aHash ifAbsent: aBlock
	objectStores do: [:each |
		(each headerOfObjectNamed: aHash ifAbsent: []) ifNotNil: [:header | ^ header]].
	^ aBlock value