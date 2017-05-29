I am a builder for a SquitVersion, which adapts a GitCommit. As commits are immutable, a version can only exist after all properties of a commit have been determined.

Initialize me with #repository: and either #patch: or #snapshot:, so I know which trees to generate.

Instance Variables
	author:		<GitStamp>
	committer:		<GitStamp>
	message:		<String>
	parents:		<SequenceableCollection of SquitVersion>
	repository:		<SquitRepository>
	patch:			<SquotPatch>
	snapshot:		<SquotSnapshot>