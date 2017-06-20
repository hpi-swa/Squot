converting
rematerialize: aMetaobject
	convertedObjects at: aMetaobject ifPresent: [:it | ^ it].
	^ convertedObjects at: aMetaobject put: (aMetaobject squotMaterializeWith: self)