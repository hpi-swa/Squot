accessing
classFolders
	^ self reference glob: [ :ref| 
		ref isDirectory and: [ ref extension = 'class' ]]