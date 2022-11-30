I know the differences between two SquotTrackedObjectMetadata objects.

Instance Variables
	diffs:		Dictionary of differences in the asSquotTrackedObjectMetadata. The keys are sequences of SquotReferences that denote the path from the root SquotTrackedObjectMetadata to the actual property being changed. The values are SquotReferenceDiffs that say what happened to the reference denoted in the key (e. g. add it, remove it, change it).
	left:		The original SquotTrackedObjectMetadata.
	right:		The modified SquotTrackedObjectMetadata.