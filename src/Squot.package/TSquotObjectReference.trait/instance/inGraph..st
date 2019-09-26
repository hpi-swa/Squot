accessing
inGraph: aObjectGraphOrShadowGraph
	^ SquotObjectReferenceInGraph new
		squotDecoratorDecoratedObject: self;
		graph: aObjectGraphOrShadowGraph;
		yourself