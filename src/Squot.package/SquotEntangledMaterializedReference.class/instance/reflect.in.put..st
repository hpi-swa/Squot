reflection
reflect: anObject in: aMirror put: newValue
	^ entangledReference populate: self in: anObject reflectedIn: aMirror with: newValue