private
capture: aDecoratedObject reflectedIn: aMirror
	| undecorated object replacement mirror shadow |
	undecorated := aDecoratedObject undecorated.
	(convertedObjects includesKey: undecorated) ifTrue: [^ self].
	capturedObject := undecorated.
	capturedObjectWithReferrer := aDecoratedObject.
	mirror := aMirror.
	object := replacedObjects at: undecorated ifAbsent: [aDecoratedObject].
	replacement := mirror replacementFor: object undecorated using: self.
	replacement ~~ object undecorated ifTrue:
		[object := replacement.
		undecorated := object undecorated.
		mirror := mirror mirrorForReplacement: undecorated.
		(aMirror shouldObjectHaveNameAssigned: capturedObject) ifTrue:
			[objectGraph "Keep the identifier."
				answer: (objectGraph nameOf: capturedObject)
				whenAskedForTheNameOf: undecorated]].
	(convertedObjects includesKey: object undecorated) ifTrue: [^ self].
	shadow := mirror capture: object with: self.
	undecorated ~~ capturedObject ifTrue:
		[self flag: #todo. "This should be the business of the mirror."
		[shadow assumeOriginalClassOf: capturedObject]
			on: MessageNotUnderstood do:
				[:e | (e message selector == #assumeOriginalClassOf: and: [e receiver == shadow])
					ifTrue: [e return]
					ifFalse: [e pass]]].
	self rememberAsShadowOfCapturedObject: shadow. "Safeguard against mirrors that do not register the shadow already."
	objectGraph addShadow: shadow of: capturedObject.