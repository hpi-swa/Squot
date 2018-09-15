testing
rematerializeAsNewGraph: anObjectGraph
	| materializer |
	materializer := SquotShadowMaterializer new.
	materializer sourceGraph: anObjectGraph.
	materializer targetGraph: anObjectGraph asShadowGraph mutableCopy.
	"do not surprisingly start to use the previous objects when applying a diff later on"
	materializer targetGraph delegateRegistry: SquotObjectRegistry new.
	materializedObject := materializer rematerialize: anObjectGraph startShadow.
	"Needs to be stored into an instance variable because the objects in the graph are
	only held onto weakly. Tests can access the object with <answer> startObject."
	^ materializer objectGraph