# Machine Setup

My personal arsenal of things I want on a new computer.

## Mac

1. Run `git --version` in order for the Mac to recognize it needs to install xcode
2. Set up an SSH key for Github
3. Run `./setup.sh`

It's possible Java will be broken. The following command (or something like it) might fix it:

```
sudo ln -sfn /opt/homebrew/Cellar/openjdk/15.0.2/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
```

