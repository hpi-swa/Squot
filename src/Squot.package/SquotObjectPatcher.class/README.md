I apply diffs to objects to alter them. My purpose is to break cycles in object graphs, so each object has its diff applied only once.

Instance Variables
	materializer:		<SquotShadowMaterializer> used to build and fill living objects
	objectRegistry:		<SquotObjectRegistry> used to look up objects by name
	patchedObjectGraph:		<SquotMutableObjectGraph> graph of objects to be altered
	patchedObjects:		<IdentityDictionary> already patched objects
