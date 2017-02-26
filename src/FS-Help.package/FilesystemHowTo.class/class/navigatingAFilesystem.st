pages
navigatingAFilesystem
	"This method was automatically generated. Edit it using:"
	"FilesystemHowTo edit: #navigatingAFilesystem"
	^HelpTopic
		title: 'Navigating a filesystem'
		contents: 
'** How to use Filesystem - Navigating a filesystem **
=====================================================

The reference assigned to the variable "working" (see tutorial "Filesystems and references") allows us to browse the filesystem. We list the entries of a directory by sending #children to the reference:
	working children.

Sending #allChildren to the reference answers a collection of all entries in all subdirectories recursively:
   working allChildren.

The slash operator answers a reference to a specific file or directory within the working directory:
	cache := working / ''package-cache''.
	
Navigating back to the parent is easy. We send #parent to the reference. We expect
the parent to be the working directory and test for that:
	parentOfCache := cache parent.
	parentOfCache = working.					" --> true "
						
The slash operator interprets the string sent to it as the name of the directory to navigate to. If the string argument contains a slash it is interpreted as part of the directory name and not as a separator. To remedy the situation references understand a second navigation message called #resolve:. Resolve expects a string argument in the form used by the "cd" command known from the Unix command line (the same syntax applies to Windows systems):
	disk working resolve: ''/''.					" the same as ''disk root'' "
	disk working resolve: ''.''.						" the same as ''disk working'' "
	disk working resolve: ''/home/leske''.		" an absolute path to a directory or file "
	disk working resolve: ''../projects''.			" a relative path from the working directory "
		
Evaluating the following expressions reveals information about the cache directory:
	cache exists.								" --> true "
	cache isFile.								" --> false "
	cache isDirectory.							" --> true "
	cache basename.							" --> ''package-cache'' "
								
Even more information is available via the filesystem entry. The entry is an instance of FSDirectoryEntry. Every reference has an associated entry holding the header information:
	cache entry creation.						" --> 2010-09-14T10:34:31+00:00 "
	cache entry modification.					" --> 2010-09-14T10:34:31+00:00 "
	cache entry size.							" --> 0 (directories have size 0) "
								
The framework also supports locations (note that locations may not work on your system. They''re still work in progress); they are late-bound references that point to a file or directory. When asking to perform a concrete operation a location behaves the same way as a reference. Filesystem supports the following locations:
	FSLocator desktop.
	FSLocator home.
	FSLocator image.
	FSLocator changes.
	FSLocator imageDirectory.
	FSLocator vmBinary.
	FSLocator vmDirectory.	

A location will dynamically adapt and always point to the place expected even when moving the image to another platform.!' readStream nextChunkText