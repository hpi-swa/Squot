accessing
selectionsUntrackedAt: aNumber put: aBoolean

	| package |
	aNumber = 1 ifTrue: ["title" ^ self].
	
	package := self untrackedPackages at: aNumber - 1.
	aBoolean
		ifTrue: [selectedUntrackedPackages add: package]
		ifFalse: [selectedUntrackedPackages remove: package ifAbsent: []].
	
	self changed: #selectionsUntrackedAt:.
	self changed: #hasUntrackedSelections