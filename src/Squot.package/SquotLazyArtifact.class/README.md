I am an artifact that loads data and metadata only when asked for it.

I am supposed to be used during only a single unit of work. That means if you want to modify my object graph and want the changes be reflected in the #content of the artifact, you have to get a new artifact from the store. I will only capture my object graph or metadata once, when you first ask for it.

Instance Variables
	contentBlock:		<Block> evaluated when the content is accessed
	storeInfoBlock:		<Block> evaluated when the storeInfo is accessed