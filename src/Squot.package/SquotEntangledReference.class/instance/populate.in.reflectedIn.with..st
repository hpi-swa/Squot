reflection
populate: anEntangledMaterializedReference in: anObject reflectedIn: aMirror with: newValue
	"Only install the newValue when all entangled references are filled in."
	scheduledTarget := {anEntangledMaterializedReference. anObject. aMirror. newValue}.
	(entangledReferences allSatisfy: [:each | each isPopulated])
		ifTrue:
			[entangledReferences do: [:each | each installTarget].
			self installTarget].
	^ newValue