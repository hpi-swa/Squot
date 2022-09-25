accessing
instanceOf: anObject from: sourceObjectGraph path: aSequenceableCollection in: searchObjectGraph ifAbsent: absentBlock
	"DiskProxies are already representants for another object. Which object that is, is determined by the properties of the proxy."
	| name |
	name := sourceObjectGraph nameOf: anObject undecorated ifAbsent: [^ anObject "treat as value"].
	^ anObject sameIn: searchObjectGraph withName: name ifAbsent: absentBlock