I decorate an object with its "owner" object (or the first other object that refers to the decorated object) and the slot that contains the decorated object.

Instance Variables
	creator:		<Object> that owns or prominently refers to the decorated object
	creatorSlot:		<Object> a Slot in the creator through which the decorated object is reached