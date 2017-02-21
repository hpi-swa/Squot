I represent a node in a git repository that can contain child nodes (mostly I simply represent a directory).

Instance Variables:
	entries	<aCollection of: GitTreeEntry>
		Holds references to all the child nodes together with some 
		additional information (see the class comment for GitTreeEntry).