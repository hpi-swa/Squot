I wrap an object graph and combine it with storage metadata and a path in a SquotSnapshot. The storage metadata is used by stores to reproducibly capture my graph and to properly restore it.

Instance Variables
	content:		the captured object graph
	path:		the path at which the content is stored in a snapshot
	storeInfo:		directions for Stores how to capture and restore the content