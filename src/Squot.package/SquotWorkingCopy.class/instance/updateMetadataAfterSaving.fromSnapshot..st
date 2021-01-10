private
updateMetadataAfterSaving: aVersion fromSnapshot: aSnapshot
	"Some repositories cause additional metadata to be added when saving an artifact for the first time. Bring this into the working copy. aSnapshot was taken from the working copy to create aVersion, which may have a slightly different snapshot."
	| cherryPickMerge |
	cherryPickMerge := self newMergeOperation
		flag: #todo; "Unit of work of the current operation should be reused."
		mergeVersion: aVersion;
		baseVersion: aSnapshot;
		workingCopySnapshot: aSnapshot;
		doNotAddParent;
		prepare;
		yourself.
	cherryPickMerge merge conflicts do: [:each | each chooseWorking].
	((cherryPickMerge merge containerModifications select: [:each | each isAddition])
		select: [:each | each willBeLoaded])
		do: [:each | "Do not load such appeared artifacts." each toggleWhetherToLoad].
	cherryPickMerge applyToWorkingCopy.