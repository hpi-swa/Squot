merging
stringOrNilMergeLeft: leftStringOrNil right: rightStringOrNil base: baseStringOrNil ifConflict: aBlock
	self
		atomicMergeLeft: leftStringOrNil
		right: rightStringOrNil
		base: baseStringOrNil
		ifSuccess: [:merged | ^ merged]
		ifConflict: ["fall through"].
	({baseStringOrNil. leftStringOrNil. rightStringOrNil} allSatisfy: #isString)
		ifFalse: [^ aBlock value].
	^ self
		stringMergeLeft: leftStringOrNil
		right: rightStringOrNil
		base: baseStringOrNil
		ifConflict: aBlock