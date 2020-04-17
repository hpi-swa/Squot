tools - debugger
outboundPointersDo: aBlock
	aBlock value: (thisContext objectClass: self).
	1 to: (thisContext objectClass: self) instSize do: [:i | aBlock value: (thisContext object: self instVarAt: i)].
	1 to: (thisContext objectSize: self) do: [:i | aBlock value: (thisContext object: self basicAt: i)].