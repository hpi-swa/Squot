private
updateMetadataAfterSaving
	"Some repositories cause additional metadata to be added when saving an artifact for the first time. Bring this into the working copy. aSnapshot was taken from the working copy to create aVersion, which may have a slightly different snapshot."
	| cherryPickMerge |
	cherryPickMerge := workingCopy newMergeOperation
		unitOfWork: unitOfWork;
		mergeVersion: newVersion;
		baseVersion: patch patched;
		workingCopySnapshot: patch patched;
		doNotAddParent;
		doNotAddGlobalObjectsAutomatically; "The saved version cannot have new artifacts that are already loaded in the image."
		prepare;
		yourself.
	cherryPickMerge merge conflicts do: [:each | each chooseWorking].
	((cherryPickMerge merge containerModifications select: [:each | each isAddition])
		select: [:each | each willBeLoaded])
		do: [:each | "Do not load such appeared artifacts." each toggleWhetherToLoad].
	cherryPickMerge applyToWorkingCopy.