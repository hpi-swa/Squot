I associate Squeak objects with paths and convert between objects and SquotArtifacts. It is my responsibility to capture and update "living" objects in the image.

Instance Variables
	objects:				<Dictionary> of the contained root objects. The artifact paths are the keys.
	paths:				<Dictionary> of the paths contained. The root objects are the keys.
	environment:		<Environment> target environment for load operations that can be directed with Environments (e. g., the loading of classes)
	additionalInfo:		<Dictionary> of SquotTrackedObjectMetadata. The artifact paths are the keys.
	objectRegistry:		<SquotObjectRegistry> remembers the names assigned to objects to identify them across snapshots.
	objectGraphs:		<Dictionary> of the object graphs already captured.
	loadOrder:			<SequenceableCollection> of paths that determines the configured loading order of the contained objects (which is stored in snapshots)

Invariants:
	objects keys asSet = paths values asSet.
	paths keys asIdentitySet = objects values asIdentitySet.
	additionalInfo keys asSet = objects keys asSet.
	loadOrder asSet = objects keys asSet.
	self artifacts keys asSet = objects keys asSet.