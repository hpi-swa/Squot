I am an abstract superclass for store implementations. My subclasses provide access to the actual data storage of a particular kind of filesystem. 

The file system can be accessed via
	FSFilesystem onDisk 
	FSFilesystem inMemory
	
My associated filesystem can be accessed as follows:
      FSDiskStore currentFilesystem	