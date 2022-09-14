accessing
selectionsTrackedAt: aNumber put: aBoolean

	| package |
	aNumber = 1 ifTrue: ["title" ^ self].
	
	package := self trackedPackages at: aNumber - 1.
	aBoolean
		ifTrue: [selectedTrackedPackages add: package]
		ifFalse: [selectedTrackedPackages remove: package ifAbsent: []].
	
	self changed: #selectionsTrackedAt:.
	self changed: #hasTrackedSelections