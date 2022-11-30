accessing
objectNamed: aName ifAbsent: absentBlock
	^ (objects at: aName ifAbsent: []) ifNil: [absentBlock value]