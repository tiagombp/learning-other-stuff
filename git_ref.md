### Setting up your Identity

(https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)

The first thing you should do when you install Git is to set your user name and email address. This is important because every Git commit uses this information, and it’s immutably baked into the commits you start creating:

```bash
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
```

Again, you need to do this only once if you pass the `--global `option, because then Git will always use that information for anything you do on that system. If you want to override this with a different name or email address for specific projects, you can run the command without the `--global` option when you’re in that project.

### SSH

#### Connecting to GitHub with SSH
https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh

1. Generating a new SSH key (https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
2. Checking for existing SSH keys (https://docs.github.com/en/github/authenticating-to-github/checking-for-existing-ssh-keys)
3. Adding your SSH key to the ssh-agent
4. Adding a new SSH key to your GitHub account (https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)
* Installing xclip
* Copying the SSH key to the clipboard
5. Testing your SSH connection (https://docs.github.com/en/github/authenticating-to-github/testing-your-ssh-connection)

```bash
ssh-keygen -t rsa -b 4096 -C "tiagombp@gmail.com"`

ls -al ~/.ssh

eval "$(ssh-agent -s)"

ssh-add /home/tiago/.ssh/id_rsa

sudo apt-get install xclip

xclip -sel clip < /home/tiago/.ssh/id_rsa.pub

ssh -T git@github.com
```

### Commiting

`git add <file>...` to update what will be committed)
`git restore <file>...` to discard changes in working directory)
`git commit -m "<message>"`
`git push`





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
