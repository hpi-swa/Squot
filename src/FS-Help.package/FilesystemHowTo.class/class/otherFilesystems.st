pages
otherFilesystems
	"This method was automatically generated. Edit it using:"
	"FilesystemHowTo edit: #otherFilesystems"
	^HelpTopic
		title: 'Other filesystems'
		contents: 
'** How to use Filesystem - Other filesystem **
=====================================================

The filesystem framework is easily extensible and there are several implementations including a ZIP, a cURL and a Git filesystem. All of these implementations comply with the public protocol of the framework and therefore it does not matter to the user on which filesystem he or she is working. Some filesystems specify additional messages to provide access to functionality beyond the scope of a simple filesystem. The ZIP filesystem for example defines the message #close which needs to be sent to the instance of a ZIP archive to flush it.!' readStream nextChunkText