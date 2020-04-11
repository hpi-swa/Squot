tools - debugger
outboundPointersDo: aBlock
	| i |
	aBlock value: (thisContext objectClass: self).
	aBlock value: decoratedObject.
	i := 2.
	[aBlock value: (thisContext object: self instVarAt: i).
	i := i + 1]
		on: Error do: [:err | err return: nil].