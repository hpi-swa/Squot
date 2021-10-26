enumerating
checkPathsTo: anObject ifMultiple: aBlock
	walk checkPathsTo: anObject ifMultiple: [aBlock value].