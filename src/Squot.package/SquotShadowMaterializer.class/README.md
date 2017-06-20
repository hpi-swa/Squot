I unpack metaobject graphs to generate normal object graphs.

Instance Variables
	convertedObjects:		<IdentityDictionary> already unpacked objects (or in progress)
	rootMetaobject:		<SquotMetaobject> top metaobject from which everything else is unpacked
	rootObject:		<Object> top rematerialized object from which all unpacked objects are reachable