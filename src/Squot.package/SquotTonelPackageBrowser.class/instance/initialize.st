initialize-release
initialize
	super initialize.
	SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #category
		using: #categoriesChanged.