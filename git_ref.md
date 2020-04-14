No you cannot force a file that is already committed in the repo to be removed just because it is added to the .gitignore

You have to git rm --cached to remove the files that you don't want in the repo. ( --cached since you probably want to keep the local copy but remove from the repo. )

```bash
git rm --cached path/to/ignored.exe

git add .
git commit -m 'clear git cache'
git push
```

To merge a Repo B into Repo A as a subfolder, run this command inside Repo A;
https://stackoverflow.com/questions/47559855/git-move-repository-to-a-subfolder-of-another-repository

```bash
git subtree add -P <prefix> <repo> <rev>
```

Set <prefix> to the name of the subdirectory, <repo> to the clone URL of Repo B, and <rev> to the revision of Repo B you want (HEAD if latest)

This will take the history of Repo B and merge it with Repo A, along with an additional merge commit.
