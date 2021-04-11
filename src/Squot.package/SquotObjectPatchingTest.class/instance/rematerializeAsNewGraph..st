testing
rematerializeAsNewGraph: anObjectGraph
	| materializer newGraph |
	materializer := SquotShadowMaterializer new.
	newGraph := anObjectGraph asShadowGraph mutableCopy.
	"do not surprisingly start to use the previous objects when applying a diff later on"
	newGraph delegateRegistry: SquotObjectRegistry new.
	materializedObject := materializer rematerializeGraph: anObjectGraph into: newGraph.
	"Needs to be stored into an instance variable because the objects in the graph are
	only held onto weakly. Tests can access the object with <answer> startObject."
	^ materializer objectGraph