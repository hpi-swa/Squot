I provide a UI to browse and manipulate working copies and their Git repositories and history.

Instance Variables
	branchList:		<Collection of String> list of ref names
	cachedCommitList:		<OrderedCollection of SquitVersion> unfiltered list of commits
	commitForCache:		<SquitVersion> commit from which the objectCache is filled
	commitListBuildProcess:		<Process> background process to load the commit list
	commitSelection:		<SquitVersion> selected commit
	commitToDiffAgainst:		<SquitVersion> remembered commit for an action involving two commits, until the second commit has been selected
	indexOfActiveHistorianInBranchList:		<Integer>
	objectCache:		<Collection of SquitArtifactWrapper> artifacts in the selected commit
	objectIndex:		<Integer> index of selected artifact
	offeredToAddFirstProject:		<Boolean> whether the user has already been asked whether he or she wants to add a first working copy
	projectIndex:		<Integer> index of selected working copy
	repositoryExists:		<Boolean> whether the selected working copy's repository still exists on the disk
	searchTerm:		<String> search term for filtering the commit list
	selectedHistorian:		<SquitHistorian>
	timeOfLastListUpdate:		<DateAndTime>
