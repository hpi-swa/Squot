# Squot [![MacOS/Linux Build Status][travis_badge]][travis] [![Windows Build Status][appveyor_badge]][appveyor]
Squeak Object Tracker - Version control for arbitrary objects in Squeak, currently with Git storage

This repository also contains a variant of the FileSystem library,
which is an alternative to the FileDirectory API and has replaced the latter in Pharo.
However, our version of the FileSystem library descends from the last version of it for Squeak
and is not compatible with Pharo's FileSystem classes.

The package that provides Git connectivity for Squot is named Squit.
It uses the package FileSystem-Git (also included here) to browse and manipulate Git repositories.

## Installation instructions

For Squeak 5.2 (and newer) just evaluate the following snippet:

```Smalltalk
Installer installGitInfrastructure.
```

For older images, make sure that you have system updates newer than 2017-03-12. The image's version number should be at about 17037 or higher.

There, install the latest [Metacello](//github.com/dalehenrich/metacello-work) first.
Then, use the following snippet to load Squot and all its dependencies:

```smalltalk
Metacello new
  baseline: 'Squot';
  repository: 'github://hpi-swa/Squot:latest-release/src';
  load.
```

## Usage instructions

After installing Squot, you will find a "Git Browser" in the Apps menu. With this tool you can create projects (in-image working copies) that can contain multiple objects, including packages. Each object is stored at or under a path. When you checkout the Git repository in the file system, an object's path is its relative path in the working copy. From the Git Browser, you can create new commits, synchronize with remote repositories (fetch, pull, push), manage and merge branches, switch between them, and compare different versions.

### Getting Started with an Existing Remote Project 

1. Open the Git Browser. Depending on your Squeak version, you can find it under Apps or under Tools. If this is the first time you open it, it might ask you whether you want to add your first project now. You can decline for now, as we do not want to add a new (empty) project.

2. The pane at the top left pane is the list of projects which are currently managed through Squot. We will now clone an existing project by opening the context menu of the list and selecting either "Clone Project" directly or "New project..." > "Clone Project".

3. A wizard opens which will guide us through the steps to clone the project.

4. First, it asks for an URL to clone from. We use the https URL of our repository for that. For Github projects you can find the https URL on the project main page after clicking on the button labeled "Clone or download" (You might have to select "Use HTTPS").

5. Second, we can enter a project name which helps us remember our project. It will be displayed in the projects list.

6. Third, we have to select a folder in which Squot can store the Git repository. You should create a dedicated folder for that even if you will not work with the working copy in the filesystem.

7. We have now provided all necessary details and Squot will go ahead and clone the project for us.

8. As soon as Squot finished cloning, we have the repository on the disk and registered in the system, but we do not yet have the objects loaded from the repository into Squeak. For that to happen, we have to click on "Checkout objects" in the context menu on the topmost commit in the list of commits, which is the pane on the top right of the git browser.

9.  We are now presented with a list of changes to be loaded through the checkout. If you have no special requirements for loading the packages, you can simply click the "accept" button.

10. After a short loading time, the objects are now loaded in the system. If the repository stored packages, you can now start browsing your code.


### Committing to a Project

1. Before committing, first check whether you are on the branch you do want to commit to in the list of branches.

2. Then simply click the button labeled "commit".

3. You will be presented with a list of changes that would be included in the commit. By unfolding the changes and opening a context menu on each individual change you can choose to exclude the change from the commit.

4. After reviewing the changes you can enter the commit message in the text box at the bottom.

5. When you are happy with the commit, you simply finish it by pressing the "commit" button.


### Notes on Pushing to Github

Please note that when you push to Github and you have two-factor-authentication activated, you can not use your ordinary password. You will have to generate a personal access token in the corresponding [settings page](https://github.com/settings/tokens). When Squot asks you for the password of the remote, enter the personal access token instead.


### Details on the Inner Workings of Squot

Internally, Squot uses an ImageStore to remember objects (including packages) that should be tracked.
A WorkingCopy combines such a store with a repository, for example a SquitRepository (a Git repository).

Terminology note: Squot is based on an abstraction for version control systems named Pur.
It coins the name "Historian" for label-based branches, such as Git's head references.

```smalltalk
workingCopy := SquotWorkingCopy new.
workingCopy store: SquotImageStore new.
workingCopy repository:
  (SquitRepository onDirectory: FileSystem disk / 'path' / 'to' / 'your' / 'repository.git').
workingCopy loadedHistorian: (workingCopy repository historianNamed: 'master').
workingCopy add: (PackageInfo named: 'YourPackage') at: 'src'.
workingCopy add: (PackageInfo named: 'AnotherPackage') at: 'src'.
workingCopy add: anyObject at: 'objects/myObject'.
workingCopy saveNewVersionInteractively.
workingCopy loadCurrentVersionInteractively.
```

Note that Monticello versions will be created in the package cache repository
whenever you save a new version (commit) that modifies the code of a package.
These were originally for backup purposes until Squot and Squit became sufficiently stable.

## Converting Monticello history

A converter and a verifier for the created versions is included.

```smalltalk
repository := SquitRepository onDirectory: FileSystem disk / 'path' / 'to' / 'your' / 'repository.git'.
packageName := 'FileSystem-Git'.
historianName := 'refs/heads/import-fsgit'.
SquotMonticelloConverter
  convertUpToLoadedVersionOfPackageNamed: packageName
  asHistorianNamed: historianName in: repository.
SquotMonticelloConverterVerifier
  verifyVersionsOf: (repository historianNamed: historianName)
  ofLoadedPackageNamed: packageName.
```

## Goodies

Because Squot does not yet include a nice visualization of the commit graph, 
you may want to create a button that opens gitk or another program on the repository.

Here a do-it for Windows users (requires OSProcess):
```smalltalk
OSProcess command: 'cmd /C start /D "', (squitRepository gitRepository repository baseDir pathString), '" gitk --all'.
```

## Squot and Metacello
Due to the way Metacello handles versioning of Smalltalk projects, projects that are managed with Squot by default cannot be upgraded using Metacello.

To fix this, add the following code to your `BaselineOf`:
``` smalltalk
projectClass
  ^ Smalltalk
    at: #MetacelloCypressBaselineProject
    ifAbsent: [super projectClass]
```
Your project can then be upgraded using the same code used to install it.

[appveyor]: https://ci.appveyor.com/project/hpi-swa/squot/branch/master
[appveyor_badge]: https://ci.appveyor.com/api/projects/status/hg2d0tbiij1bm052/branch/master?svg=true
[travis]: https://travis-ci.org/hpi-swa/Squot
[travis_badge]: https://travis-ci.org/hpi-swa/Squot.svg?branch=master
