capturing
capture: anObject with: aSquotObjectCapturer ifReplaced: aBlock
	"Use aCapturer to answer a conserved form of me that is suitable to be stored in Snapshots."
	| newShadow proxy |
	proxy := self replacementFor: anObject using: aSquotObjectCapturer.
	proxy undecorated == anObject
		ifTrue:
			[newShadow := self newShadowObject.
			aSquotObjectCapturer rememberAsShadowOfCapturedObject: newShadow.
			self initializeSnapshot: newShadow of: anObject with: aSquotObjectCapturer]
		ifFalse:
			[aBlock value: proxy.
			newShadow := (self mirrorForReplacement: proxy undecorated)
								capture: proxy undecorated
								with: aSquotObjectCapturer
								ifReplaced: aBlock.
			newShadow assumeOriginalClassOf: anObject].
	^ newShadow