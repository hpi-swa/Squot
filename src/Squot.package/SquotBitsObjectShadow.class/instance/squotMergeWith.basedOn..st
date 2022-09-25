merging
squotMergeWith: incomingSequenceShadow basedOn: baseSequenceShadow
	| diff3 instructions modifications offset conflicts merge |
	diff3 := Diff3 new
		file0: (baseSequenceShadow ifNil: [ByteArray empty]) value;
		file1: self value;
		file2: incomingSequenceShadow value;
		diffClass: GenericDiff squotDiffClass;
		yourself.
	instructions := diff3 mergeIndices.
	modifications := OrderedCollection new.
	offset := 1.
	instructions do:
		[:each | | length mine replacement |
		(each isKindOf: Diff3Conflict)
			ifTrue: [length := each left length]
			ifFalse:
				[length := each length.
				mine := value copyFrom: offset to: offset + length - 1.
				replacement := each extractFrom: (each side caseOf: {[#original] -> [baseSequenceShadow "cannot be nil in this case" value]. [#left] -> [value]. [#right] -> [incomingSequenceShadow value]}).
				mine ~= replacement ifTrue: [modifications add: {Interval from: offset to: offset + length - 1. mine. replacement}]].
		offset := offset + length].
	conflicts := (instructions select: [:each | each isKindOf: Diff3Conflict])
		collect: [:each | {Interval from: each left offset to: each left offset + each left length - 1. each original extractFrom: (baseSequenceShadow ifNil: [ByteArray empty]) value. each left extractFrom: value. each right extractFrom: incomingSequenceShadow value. nil "choice"}].
	merge := SquotSequenceableCollectionMerge into: self merge: incomingSequenceShadow basedOn: baseSequenceShadow modifications: modifications conflicts: conflicts.
	^ merge