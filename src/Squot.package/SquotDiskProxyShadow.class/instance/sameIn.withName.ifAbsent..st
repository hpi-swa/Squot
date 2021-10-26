accessing
sameIn: aShadowGraph withName: aName ifAbsent: aBlock
	^ [aShadowGraph class squotMirror reflect: (SquotGraphElementWithName name: aName) of: aShadowGraph] on: KeyNotFound do: [:e | e return: aBlock value]