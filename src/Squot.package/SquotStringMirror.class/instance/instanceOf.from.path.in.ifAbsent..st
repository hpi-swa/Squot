accessing
instanceOf: aString from: sourceObjectGraph path: aSequenceableCollection in: searchObjectGraph ifAbsent: absentBlock
	| name |
	name := sourceObjectGraph nameOf: self ifAbsent: [^ aString "treat as value"].
	^ aString sameIn: searchObjectGraph withName: name ifAbsent: absentBlock