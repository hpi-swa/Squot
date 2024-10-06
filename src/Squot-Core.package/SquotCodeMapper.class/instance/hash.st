comparing
hash
	^ (super hash
		bitXor: self path hash)
		bitXor: self package hash