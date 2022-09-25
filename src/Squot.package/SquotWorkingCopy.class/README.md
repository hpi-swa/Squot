I connect a project with a local repository and a historian, so you can create new versions with snapshots from the project and update the project from other versions.

Instance Variables
	name:				<String> display name of this working copy
	store:				<Object> backing store, usually a SquotImageStore
	repository:			<TSquotLocalRepository> repository used to read and write history
	loadedHistorian:	<TSquotLocalHistorian> current historian, used to write history
	previouslySavedArtifacts:	<Dictionary> cache of the last saved state of the contained artifacts
	shouldStoreMetadata:	<Boolean> set to false to not store Squot metadata files
	additionalParents:	<OrderedCollection> additional parent versions of the next version to be saved (for merges)
	lastLoadedHistorian: <TSquotLocalHistorian> private historian used to mark the latest version that was loaded or saved using this working copy.
	snapshotBlock:		<Block> used to capture a snapshot. See #withCurrentSnapshot:
	loadedVersion:		<TSquotVersion> latest version that was loaded or saved using this working copy.
	previousVersionId:	<Object> deprecated. Will be removed in a future release.
	previousSnapshot:	<Object> deprecated. Will be removed in a future release.