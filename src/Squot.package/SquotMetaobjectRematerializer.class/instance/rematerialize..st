converting
rematerialize: aMetaobject
	convertedObjects at: aMetaobject ifPresent: [:it | ^ it].
	^ aMetaobject squotMaterializeWith: self