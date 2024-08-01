# Helpfull configs for git on windows

## CRLF

Usually, git will automatically add / remove <CR> characters to the line endings when pulling / pushing from a repo.
This can cause issues, for example, when that repo contains bash scripts, that are to be copied into a linux container.
The script gets pulled, LF line endings are converted into CRLF line endings, the file is copied into an image and inside the image, bash can't work with that file, because the line endings are wrong.

### Fix for single repo

If you need the CRLF line endings for some reason in another repo and only want to apply the fix for one repo, simple clone the repo with the following command:

```bash
git clone --config core.autocrlf=false --config core.eol=lf [OTHER_OPTIONS] <Repo-URI>
```

### Globally change config

If you don't want this in general (let's be real, editors on windows handle LF line endings completely normal), just run the following commands

```bash
git config --global core.autocrlf false
git config --global core.eol lf
```

Note: You still can opt in using autocrlf for certain repos by applying the [command for a single repo](#fix-for-single-repo) "reversed".
