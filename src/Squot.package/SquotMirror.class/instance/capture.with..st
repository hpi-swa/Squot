capturing
capture: anObject with: aSquotObjectCapturer
	"Answer a snapshot of the object."
	"For objects that might have cyclic references, do not attempt to capture the whole object subgraph! Instead enumerate the references, only create the new shadow object and prepare it, then announce the references to the capturer with:
		aSquotObjectCapturer capture: referencedObject asValueOf: aReference from: anObject reflectedIn: aMirror
			intoValueOf: shadowsReference from: shadowOfAnObject reflectedIn: aShadowMirror"
	^ self subclassResponsibility