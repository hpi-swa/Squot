accessing
instanceOf: anObject from: sourceObjectGraph path: aSequenceableCollection in: searchObjectGraph ifAbsent: absentBlock
	^ anObject sameIn: searchObjectGraph asIn: sourceObjectGraph ifAbsent: absentBlock