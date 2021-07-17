I tell how the target of a reference has changed. Either the target has mutated or it was exchanged. The mutation might also be "deep" within the object, which means in Smalltalk terms, that an instance variable might not have actually changed to another object, but the object in this variable might have somehow changed.

For example:
	Set #1 -> Array #1 -> 1
		changes to:
	Set #1 -> Array #1 -> 2
The reference from the Set to the Array does not change, and the Array stays the same, but the "value" of the array (and more importantly its hash) has changed, so the Set may get a SquotDifferenceReferenceTarget in its diff, even though no reference of the Set needs to be updated to reproduce the change. The Set may need to be rehashed though. If there were another Array between the Array #1 and the numbers, the situation would basically be the same as far as the Set is concerned.