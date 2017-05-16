I compute merge-bases of multiple versions in a history graph.
A merge-base is a best common ancestor of a set of versions, where best means that a merge-base is not the ancestor of another merge-base. However, there can be multiple merge-bases for a set of versions.

I use VersionsMergeBaseMarker to mark versions (nodes) in the history (graph) with their ancestry state, respective to the task.

Instance Variables
	commonAncestors:		<Set> of merge-base candidates
	markedVersions:		<Dictionary> of versions and their marked variants
