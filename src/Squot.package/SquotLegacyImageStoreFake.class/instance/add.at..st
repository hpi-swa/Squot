adding and removing
add: anObject at: path
	"Add the object to the list of artifacts. Since the object already exists, it must not be overwritten in the store, but which store to use must be figured out."
	| storeInfo artifact |
	storeInfo := SquotTrackedObjectMetadata withNewId.
	storeInfo
		at: 'path' put: path;
		at: 'references' put: ({
			'object_1' -> OrderedDictionary new
		}).
	true caseOf:
		{[anObject isKindOf: PackageInfo] ->
			[storeInfo references first value
				at: 'type' put: 'package';
				at: 'content-type' put: SquotCypressCodeSerializer contentType;
				at: 'packageName' put: anObject packageName].
		[anObject isKindOf: Class] ->
			[storeInfo references first value
				at: 'type' put: 'class';
				at: 'content-type' put: SquotCypressCodeSerializer contentType;
				at: 'className' put: anObject name]}
		otherwise: 
			[storeInfo references first value
				at: 'type' put: 'ValueHolder';
				at: 'content-type' put: 'application/octet-stream';
				at: 'codec-class' put: 'SmartRefStream'].
	workingCopy repository initializeStoreInfo: storeInfo forObject: nil.
	artifact := SquotArtifact storeInfo: storeInfo.
	workingCopy putArtifact: artifact.
	workingCopy storeForArtifact: artifact. "access once"
	true caseOf:
		{[anObject isKindOf: PackageInfo] -> [].
		[anObject isKindOf: Class] -> []}
		otherwise: 
			[(workingCopy storeForArtifact: artifact)
				contents: anObject;
				artifact: artifact].
	self atPath: path put: artifact.
	^ artifact