store implementation registry
detectImplementation: aBlock ifNone: errorBlock
	^ (ImplementationRegistry ifNil: [^ errorBlock value]) detect: aBlock ifNone: errorBlock