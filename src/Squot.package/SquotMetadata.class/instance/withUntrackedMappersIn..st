untracked-mappers
withUntrackedMappersIn: aFileSystem
	^ self copy
		mappers: self trackedMappers, (self untrackedMappersIn: aFileSystem);
		yourself