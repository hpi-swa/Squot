I unpack graphs of object shadows to generate regular object graphs.

Instance Variables
	convertedObjects:		<IdentityDictionary> already unpacked objects (or in progress)
	rootMetaobject:		<SquotMetaobject> top shadow from which everything else is unpacked
	rootObject:		<Object> top rematerialized object from which all unpacked objects are reachable