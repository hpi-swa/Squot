public
close
	id ifNil: [^ self].
	Primitives close: id.
	id := nil