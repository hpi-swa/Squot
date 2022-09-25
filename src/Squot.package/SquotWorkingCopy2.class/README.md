I am a project store that coordinates between different object stores that hold objects, and a repository to create new versions from the current state in these stores.

Instance Variables
	activeHistorian:		<TSquotLocalHistorian>
	additionalParentVersions:		<Collection>
	loadedVersion:		<TSquotVersion>
	name:		<String>
	newVersionMessage:		<String>
	previouslySavedArtifactSnapshots:		<Dictionary>
	project:		<SquotProject>
	repository:		<TSquotLocalRepository>
	stores:		<Dictionary>

activeHistorian
	- The historian with which new versions will be created.

additionalParentVersions
	- During merges, additional parent versions can be added for creating a new version later.

loadedVersion
	- The last version from which objects were confirmedly loaded into the stores. The activeHistorian might have written new versions in the meantime (through other programs) of which this working copy, its stores, or even the Smalltalk image have not seen anything yet.

name
	- Label of this working copy for user interfaces.

newVersionMessage
	- Remembered or preprared log message for the next version to be created. Can be nil if no such message was stored yet. If not nil, users will get this value as a template for the next version's log message. If nil, they will be prompted to enter a log message from scratch.

previouslySavedArtifactSnapshots
	- Cache for artifact snapshots so that what has just been saved does not have to be read back again from the newly created version.

project
	- Manifest of this working copy. Editable.

repository
	- Repository to which this working copy is connected. The activeHistorian is supposed to operate on this repository.

stores
	- Object stores that are used to access the objects tracked in this working copy.
