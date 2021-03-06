private
resolveLoadOrders
	"Determine whether there are conflicts. Answer either a tuple of a resolved load order and #noConflicts, or a tuple of a cycle path and #conflicts."
	| resolvedWorking resolvedIncoming |
	resolvedWorking := editedWorking.
	"If the incoming order is chosen, reorder elements accordingly and keep those which are not present in the incoming order."
	containerConflicts do: [:each | each resolution ~= #working ifTrue:
			[resolvedWorking := self copy: editedWorking withOrder: incoming]].
	"Now prepare an incoming order to merge.
	Remove elements that were removed in the working copy from incoming order."
	resolvedIncoming := incoming asOrderedCollection select: [:each | resolvedWorking includes: each].
	"Add elements that were removed in incoming, but where the user chose to keep them."
	(resolvedWorking anySatisfy: [:each | (resolvedIncoming includes: each) not]) ifTrue:
		[resolvedIncoming := self copy: resolvedWorking withOrder: resolvedIncoming].
	containerConflicts do: [:each | each resolution ~= #incoming ifTrue:
			["Use working order, but with all incoming additions. Note that resolvedWorking already fulfills this requirement."
			resolvedIncoming := resolvedWorking]].
	^ self resolveOrders: resolvedWorking and: resolvedIncoming