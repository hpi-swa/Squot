running
tearDown
	ChangeSet current removeClassAndMetaClassChanges: sampleTrait.
	SquotIgnoredSmalltalkCode
		unignoreClass: sampleTrait name;
		unignoreClass: sampleTrait classTrait name.
	sampleTrait removeFromSystem: false.
	"Cannot use classFactory delete: because it sends messages that Trait does not understand."
	classFactory cleanUp.