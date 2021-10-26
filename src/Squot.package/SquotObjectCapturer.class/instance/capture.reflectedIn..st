private
capture: aDecoratedObject reflectedIn: aMirror
	| undecorated object shadow |
	undecorated := aDecoratedObject undecorated.
	(convertedObjects includesKey: undecorated) ifTrue: [^ self].
	capturedObject := undecorated.
	capturedObjectWithReferrer := aDecoratedObject.
	object := replacedObjects at: undecorated ifAbsent: [undecorated].	
	shadow := aMirror capture: object with: self ifReplaced:
		[:proxy |
		(aMirror shouldObjectHaveNameAssigned: capturedObject) ifTrue:
			[objectGraph "Keep the identifier."
				answer: (objectGraph nameOf: capturedObject)
				whenAskedForTheNameOf: proxy undecorated].
		(convertedObjects includesKey: proxy undecorated) ifTrue: [^ self]].
	self rememberAsShadowOfCapturedObject: shadow. "Safeguard against mirrors that do not register the shadow already."
	objectGraph addShadow: shadow of: capturedObject.