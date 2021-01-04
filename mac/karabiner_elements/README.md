# Karabiner-elements preferences

To symlink to the karabiner.json settings file rather than having it in `~/.config/karabiner`, the symlink needs to be to the whole `~/.config/karabiner` directory, rather than the json file.

After moving `~/config/karabiner` elsewhere and symlinking to it in `~/.config`, the `karabiner_console_user_server` process needs to be restarted by running:

```
launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server
```

### References

[Karabiner-elements manual on configuration directory location](https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path/)
