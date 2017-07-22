accessing
squotDecoratorClass
	"Primitive. Answer the object which is the receiver's class. Essential. See 
	Object documentation whatIsAPrimitive."

	<primitive: 111>
	^ self class
	"when this is executed by the VM, this answers the correct result, but in the Debugger, it is wrong!"