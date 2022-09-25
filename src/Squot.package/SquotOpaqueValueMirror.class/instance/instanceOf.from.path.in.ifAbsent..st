accessing
instanceOf: anObject from: sourceObjectGraph path: aSequenceableCollection in: searchObjectGraph ifAbsent: absentBlock
	| name |
	name := sourceObjectGraph nameOf: anObject undecorated ifAbsent: [^ anObject "treat as value"].
	self isThisEverCalled. "If this line is removed, consider whether SquotDiskProxyMirror override can be removed."
	^ anObject sameIn: searchObjectGraph withName: name ifAbsent: absentBlock