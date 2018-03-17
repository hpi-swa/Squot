I decorate arbitrary objects. From an outside object's view, I extend the interface of the decorated object. See decorator pattern. I use #doesNotUnderstand: to delegate messages that are not relevant for the decoration to the decorated object.

To not inherit too many "own" methods from Object, this class inherits from ProtoObject. On the other hand, this means some useful or required methods only present in Object, but not in ProtoObject, are reimplemented here.

Instance Variables
	decoratedObject:		<Object>