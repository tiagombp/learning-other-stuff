No you cannot force a file that is already committed in the repo to be removed just because it is added to the .gitignore

You have to git rm --cached to remove the files that you don't want in the repo. ( --cached since you probably want to keep the local copy but remove from the repo. )

```bash
git rm --cached path/to/ignored.exe

git add .
git commit -m 'clear git cache'
git push
```
