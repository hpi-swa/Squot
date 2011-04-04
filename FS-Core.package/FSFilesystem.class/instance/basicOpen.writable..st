private
basicOpen: aResolvable writable: aBoolean
	| path |
	path := self resolve: aResolvable.
	^ store basicOpen: path writable: aBoolean