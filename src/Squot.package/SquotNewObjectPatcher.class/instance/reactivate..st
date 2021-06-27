private
reactivate: anObject
	| materializedObject |
	materializedObject := anObject squotReactivateWith: self.
	"Update all known references to the reactivated object where its hash matters. Reactivate each object that needs no more references to be filled in."
	(pendingIncomingReferencesForHash removeKey: (treatedObjects keyAtValue: anObject) ifAbsent: [#()]) do:
		[:eachTuple | | referrer mirror reference diff remaining |
		referrer := eachTuple first. mirror := eachTuple second. reference := eachTuple third. diff := eachTuple fourth.
		remaining := pendingOutgoingReferences at: referrer.
		diff squotReflectOn: referrer in: mirror withValue: materializedObject.
		remaining remove: reference.
		remaining ifEmpty:
			["Reactivate object if all references are filled in now."
			pendingOutgoingReferences removeKey: referrer.
			self reactivate: referrer]].
	self haltIf: (anObject ~~ materializedObject "Safeguard against dangerous become operations."
		and: ["anObject was not freshly created during this materialization" (true flag: #todo "formerly thisContext sender method ~~ (SquotObjectShadow >> #squotMaterializeWith:)")
		and: [anObject class isWeak not]]).
	anObject ~~ materializedObject ifTrue:
		"For example if anObject is a DiskProxy."
		[anObject becomeForward: materializedObject copyHash: false].
	^ anObject