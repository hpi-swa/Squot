as yet unclassified
tryAutoMergeMethodsLeft: leftDefinition right: rightDefinition base: baseDefinition
	| category diffResult |
	category := SquotMergeUtilities
		atomicMergeLeft: leftDefinition category
		right: rightDefinition category
		base: baseDefinition category
		ifConflict: [^ false].
	diffResult := Diff3 new
		file0: baseDefinition source lines;
		file1: leftDefinition source lines;
		file2: rightDefinition source lines;
		diffClass: HuntMcilroyDiff;
		merge: true.
	diffResult := (diffResult size = 1 and: [diffResult first key = #ok])
					ifTrue: [diffResult first value]
					ifFalse: [^ false].
	diffResult := diffResult joinSeparatedBy: Character cr.
	diffResult := MCMethodDefinition
					className: leftDefinition className
					classIsMeta: leftDefinition classIsMeta
					selector: leftDefinition selector
					category: category
					timeStamp: Utilities changeStamp
					source: diffResult.
	self addOperation: (MCModification of: leftDefinition to: diffResult).
	^ true