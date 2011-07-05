I present a low-level protocol for interacting with filesystems. I hold a reference to
a store (a subinstance of FSStore) which takes care of the details of performing 
file and directory operations on the filesystem I represent. 

I keep track of the current directory, and am responsible for resolving all paths that
I pass into my store. My store acts as a factory and offers platform specific actions.


Filesystem instances know two methods that return an FSReference object: workingDirectory and root.

FSFilesystem onDisk workingDirectory
FSFilesystem onDisk root

