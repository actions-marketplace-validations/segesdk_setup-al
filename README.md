# GitHub Action - Setup-AL
This action is used to setup a Business Central build environment based on the AL Language compiler. 

This GitHub Action will:
  1. Download the AL-Language vsix extension for Visual Studio Code
  2. Setup the environment variable PATH to alc.exe for the .NET 5 version in bin\win32
 

# Getting started

Add the following action to your workflow and use alc.exe through out your workflow job. The action can take 2 parameters

1. version: specifying the desired version to install from Visual Studio Code marketplace. E.g. 9.0.605172. See https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al for version history
2. alternativeDownloadUrl: you can specify your own alternative download url, for self hosting the binaries and circumventing the rate limit policy on vscode marketplace. See https://go.microsoft.com/fwlink/?LinkId=823950

```yaml
- name: Setup AL compiler
  uses: segesdk/setup-al@3454bb07d3c88bdee2ef90ed5ee572e5ea1560d3
  with:
    version: 9.0.605172
```
*Note: best practice is to always review the code for latest commit and only reference the action with a SHA and not a version. This ensures that the contributors cannot alter the code running in your pipelines. E.g.*
```uses: segesdk/setup-al@3454bb07d3c88bdee2ef90ed5ee572e5ea1560d3```
 

# Status
This is currently in pre-production and being testet. Note the action is only usable on a windows build runner at the moment. Note also that currently the vsix extension package is download from the Visual Studio Marketplace, which enforce a rather aggressive rate policy. This means that the action, when not using the alternativeDownloadUrl, can only be invoke a certain number of times a minute. Issue regarding this -> https://github.com/microsoft/AL/issues/7003#issuecomment-1103631650
