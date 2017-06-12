initialize-release
capture: originalObject copy: copyOfOriginalObject with: metaobjectBuilder at: nameOrIndex into: store
	store
		at: nameOrIndex
		put: (metaobjectBuilder squotContentFrom: originalObject andItsCopy: copyOfOriginalObject)