accessing
types
	^ self allSubclasses reject: [ :class | class isAbstract ]