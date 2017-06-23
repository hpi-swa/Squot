I provide access to the packed-refs file of a GitRepository. I can read and write that file and provide facilities to access and enumerate the references therein.

Instance Variables
	packedRefsFile:		<FSReference> to the 'packed-refs' file on which i/o should take place
	refsDictionary:		<Dictionary> the refs and signatures in the file (nil until read)