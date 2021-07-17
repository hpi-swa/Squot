converting
sourceNameOf: aShadow ifPresent: unaryBlock
	| name |
	self deprecated.
	sourceGraph ifNotNil:
		[name := sourceGraph nameOf: aShadow undecorated ifAbsent: [].
		name ifNotNil: [^ unaryBlock value: name]].
	aShadow hasSquotShadowName ifTrue: [^ unaryBlock value: aShadow name].
	^ nil