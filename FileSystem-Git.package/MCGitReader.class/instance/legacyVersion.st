accessing
legacyVersion
	| version versionInfo |

	"1 vs 0 based offsets madness! hence convert from internal streams to external ones"
	version := MCMczReader versionFromStream: (self reference , 'mcz') readStream contents readStream.
	
	versionInfo := version info.
	
	"manually hack in the UUID"
	versionInfo
		initializeWithName: version name 
		id: self reference filesystem revision sha1
		message: versionInfo message 
		date: versionInfo date 
		time: versionInfo time 
		author: versionInfo author
		ancestors: versionInfo ancestors 
		stepChildren: versionInfo stepChildren.
	
	version 
		setPackage: version package
		info: versionInfo
		snapshot: version snapshot
		dependencies: version dependencies.
	^ version
		