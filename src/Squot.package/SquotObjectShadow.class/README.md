I conserve an object for storage as part of a Snapshot.

Instance Variables
	originalClass:	<Class> class of the conserved object
	capturedClass:	<Class> class that was actually captured (e. g. if the original object is replaced by a proxy)
	slots:			<Dictionary> Holds the captured state of the object. Associations are subinstances of SquotShadowSlot.

slots
	- Stores the conserved objects that were bound to my object's variables. The keys are instance variable names or indices. The instance variables of all superclasses of my object's class are included (flattened hierarchy).

originalClass
	- Class of the object that I conserve. Used to rematerialize a new instance.

capturedClass
	- Some objects are not captured as-is, but replaced by a proxy. See the uses of DiskProxy for examples. The class of the proxy is stored in capturedClass.