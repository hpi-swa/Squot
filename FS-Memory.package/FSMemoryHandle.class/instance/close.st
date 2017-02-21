public
close
	writable ifTrue: [self truncateTo: size].
	bytes := nil