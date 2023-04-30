hashing
addRollingValueAt: anIndex
	"direct accesses for performance"
	hashValue := hashValue bitXor: (U at: (data at: anIndex - self class window) + 1).
	self addFirstWindowValueAt: anIndex.