hashing
addFirstWindowValueAt: anIndex
	"direct accesses for performance"
	hashValue :=
		(((hashValue bitShift: 8) bitOr: (data at: anIndex))
			bitXor: (T at: (hashValue bitShift: self class shift) + 1))
		bitAnd: self class hashMask.