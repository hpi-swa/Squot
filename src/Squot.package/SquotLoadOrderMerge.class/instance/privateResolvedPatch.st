private
privateResolvedPatch
	| resolvedWorking resolvedIncoming |
	resolvedWorking := editedWorking.
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
	"Add elements that were removed in incoming, but where the user chose to keep them."
	"Use incoming order, but include all elements only contained in working."
	(resolvedWorking anySatisfy: [:each | (resolvedIncoming includes: each) not]) ifTrue:
		[| unique dependencies insertIndex newOrder |
			unique := resolvedWorking copyWithoutAll: resolvedIncoming.
			newOrder := resolvedIncoming intersection: resolvedWorking.
			unique do:
				[:eachUnique |
				dependencies := (resolvedWorking copyUpTo: eachUnique) intersection: newOrder.
				insertIndex := 1.
				[dependencies notEmpty] whileTrue:
					[dependencies remove: (newOrder at: insertIndex) ifAbsent: [].
					insertIndex := insertIndex + 1].
				newOrder add: eachUnique beforeIndex: insertIndex].
			resolvedIncoming := newOrder].
	containerConflicts do: [:each | each resolution ~= #incoming ifTrue:
			["Use working order, but with all incoming additions."
			resolvedIncoming := resolvedWorking]].
	^ self autoResolve: resolvedWorking and: resolvedIncoming