capturing
capture: anObject with: aSquotObjectCapturer ifReplaced: aBlock
	"Answer a snapshot of the object. If it is supposed to be replaced by a proxy, evaluate aBlock with the proxy before creating the snapshot of the proxy."
	"For objects that might have cyclic references, do not attempt to capture the whole object subgraph! Instead enumerate the references, only create the new shadow object and prepare it, then announce the references to the capturer with:
		aSquotObjectCapturer capture: referencedObject asValueOf: aReference from: anObject reflectedIn: aMirror
			intoValueOf: shadowsReference from: shadowOfAnObject reflectedIn: aShadowMirror"
	^ self subclassResponsibility