I contain a graph of objects encountered during one capture operation.

Instance Variables
	objects:		<Dictionary> objects in the source graph by name
	shadows:		<Dictionary> shadows in the graph of shadows by name
	startName:		<Object> name of the object from which the capture operation was started
	delegateRegistry:	<SquotObjectRegistry> that knows more objects than me from other capture operations. Will be asked if I do not know an answer and updated when I am.