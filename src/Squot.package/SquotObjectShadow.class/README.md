I conserve an object for storage as part of a Snapshot.

Instance Variables
	instVars:		<Dictionary> conserved instance variables
	originalClass:		<Class> class of the conserved object
	variableSizePart:		<Array> conserved slots of a variably sized object

instVars
	- Stores the conserved objects that were bound to my object's instance variables.
	The keys are instance variable names. The instance variables of all superclasses of my
	object's class are included (flattened hierarchy).

originalClass
	- Class of the object that I conserve. Used to rematerialize a new instance.

variableSizePart
	- Stores the conserved objects that were placed in my object's variable size part.
