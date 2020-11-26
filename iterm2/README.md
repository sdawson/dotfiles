# iTerm Preferences

## Colour Schemes included in this repo

## Transferring iTerm2 settings between computers

### Preferences

To save a set of preferences, open iTerm2 Preferences, then select the General tab. In the General tab select the 'Load preferences from a custom folder or url' checkbox, then click the Browse button to select a folder to save the preferences to. After a folder is selected, clicking the 'Save current settings to folder' button will save preferences to that folder.

To restore a set of preferences, open iTerm2 Preferences and in the General tab select the 'Load preferences from a custom folder or url' checkbox, then select the folder the preferences are located in.

### Colour Schemes

To save a colour scheme, open iTerm2 Preferences, then select the Profiles tab. Click the Colours heading, then click the 'Colour Presets' dropdown menu. Click Export to save a `color_scheme.itermcolors` file containing the colour scheme.

To load a colour scheme, open iTerm2 Preferences, select the Profiles tab then the Colours heading. Click the 'Colour Presets dropdown menu', click Import then load the `colour_scheme.itermcolors` file that was previously saved.

### Profiles

To save an iTerm2 profile, open iTerm2 Preferences, then select the Profiles tab. Click the 'Other Actions' dropdown in the lower left of the modal then click 'Copy all profiles as JSON'. Paste the resulting files in a new JSON file.

To load an iTerm2 profile, copy the profile JSON file into `~/Library/Application Support/iTerm2/DynamicProfiles/`. Any profiles present in that folder will get dynamically loaded into iTerm2 and can then be used.

### References

[Suggestions for exporting iTerm2 preferences, colour schemes and profiles](https://stackoverflow.com/questions/22943676/how-to-export-iterm2-profiles)
[Exporting and import colour schemes](https://stackoverflow.com/questions/30713084/can-not-import-iterm2s-color-scheme)
[Dynamic Profiles](https://www.iterm2.com/documentation-dynamic-profiles.html)
