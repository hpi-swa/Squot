instance creation
object: anObject mirror: aMirror
	^ self new
		setMirror: aMirror object: anObject;
		yourself