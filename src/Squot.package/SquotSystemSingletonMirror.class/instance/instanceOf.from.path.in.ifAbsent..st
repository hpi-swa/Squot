accessing
instanceOf: anObject from: sourceObjectGraph path: aSequenceableCollection in: searchObjectGraph ifAbsent: absentBlock
	"System singletons are the same in any object graph"
	^ anObject
	
	"If we would support exchanging graphs between different systems, for example a Smalltalk system and an object system of another programming language (C, Lisp, Java, ...), this might look different. But we do not support that at this time."