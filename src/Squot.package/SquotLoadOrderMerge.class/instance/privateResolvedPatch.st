private
privateResolvedPatch
	| resolvedWorking resolvedIncoming |
	resolvedWorking := OrderedCollection newFrom: working.
	containerModifications keysAndValuesDo: 
		[:each :what |
		what = #add ifTrue:
			[ | dependencies insertIndex |
			dependencies := ((incoming copyUpTo: each) intersection: resolvedWorking) asSet.
			insertIndex := 1.
			[dependencies notEmpty] whileTrue:
				[dependencies remove: (resolvedWorking at: insertIndex) ifAbsent: [].
				insertIndex := insertIndex + 1].
			resolvedWorking add: each beforeIndex: insertIndex].
		what = #remove ifTrue: [resolvedWorking remove: each]].
	containerConflicts do: [:each | each resolution ~= #working ifTrue:
			["Use incoming order, but include all elements only contained in working."
			| unique dependencies insertIndex newOrder |
			unique := resolvedWorking copyWithoutAll: incoming.
			newOrder := incoming intersection: resolvedWorking.
			unique do:
				[:eachUnique | self isThisEverCalled.
				dependencies := (resolvedWorking copyUpTo: eachUnique) intersection: newOrder.
				insertIndex := 1.
				[dependencies notEmpty] whileTrue:
					[dependencies remove: (newOrder at: insertIndex) ifAbsent: [].
					insertIndex := insertIndex + 1].
				newOrder add: eachUnique beforeIndex: insertIndex].
			resolvedWorking := newOrder]].
	resolvedIncoming := incoming asOrderedCollection select: [:each | resolvedWorking includes: each]. "This removes elements removed in the working copy."
	containerConflicts do: [:each | each resolution ~= #incoming ifTrue:
			["Use working order, but with all incoming additions."
			resolvedIncoming := resolvedWorking]].
	^ self autoResolve: resolvedWorking and: resolvedIncoming