I apply marks to versions based on their ancestry during the finding of merge-bases.

Instance Variables
	commonAncestors:		<Set> of marked versions that are candidates to be merge-bases
	marksKeeper:		<Object> that provides markable objects for versions
	versionsQueue:		<Collection> search frontier for traversing the history graph