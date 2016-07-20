

# XcodeExtractor

XcodeExtractor is a tool for automatically generating file for use within an xcode project. The tool is designed to run during the build phase and recreate files to keep them fully up to date. At this time the only functioning part is for generating an enum for segues as well as a helper protocol.

## Installation
* Build the project
* Copy the built tool into /usr/local/bin

## Usage

* Open up the Build Phases
* Add a New Run Script Phase
* Move the New Run Script Phase to under Target
* Dependencies
* In the script line type "XcodeExtractor -s -dest (the location to your projects sources directory) -search (the location of the search directory)"

```
XcodeExtractor -segue -dest /Users/me/HotProject/HotProject -search /Users/me/HotProject/HotProject
```

## Restrictions

There are a couple of restriction upon using this tool for the segue names. 

* The segue must start with a valid swift variable starting letter. (ie no numbers)
*  The segue can not match another segue after being converted into a variable name. See the *String+Extras.swift* file for the code.
  * Camel casing of the works
  * Removal of spaces

## Idea
The idea for this tool came from WWDC 2015 session 411. In the video there is a point that talks about using an *enum* for the segues to eliminate spelling problems. The only remaining major problem was that every time a segue was added then a second entry had to be added in the controller file.
