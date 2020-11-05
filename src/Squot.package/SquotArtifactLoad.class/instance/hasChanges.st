testing
hasChanges
	^ true "Not to the snapshot, but to the state of the working copy."
	"This does not depend on willBeLoaded, because loading of an unloaded artifact should be deactivated initially when users choose the changes they wish to load. Diffs without changes would get filtered out when preparing the patch that is shown in the user interface."