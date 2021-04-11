private
reactivate: anObject
	| materializedObject |
	materializedObject := anObject squotReactivateWith: self.
	self haltIf: (anObject ~~ materializedObject "Safeguard against dangerous become operations."
		and: ["anObject was not freshly created during this materialization" (true flag: #todo "formerly thisContext sender method ~~ (SquotObjectShadow >> #squotMaterializeWith:)")
		and: [anObject class isWeak not]]).
	anObject ~~ materializedObject ifTrue:
		"For example if anObject is a DiskProxy."
		[anObject becomeForward: materializedObject copyHash: false].
	^ anObject