public converting
rematerializeGraph: aShadowGraph
	^ self rematerializeGraph: aShadowGraph into: (SquotMutableObjectGraph empty
														delegateRegistry: objectRegistry;
														yourself)