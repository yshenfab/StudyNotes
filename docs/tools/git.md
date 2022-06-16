# Git

## Config

refer to dotfiles repo

## SSH
### ssh-keygen & add key
```sh
ssh-keygen -t rsa -b 4096 -C "email@domain"
```
进入github settings，添加到New SSH key

复制~/.ssh/id_rsa.pub文件中的内容，粘贴过来

### Authentication
```sh
ssh -T git@github.com
```
如果看到You've successfully authenticated, but GitHub does not provide shell access表明成功

## GPG
### Generate GPG Key
```sh
gpg --gen-key
```
根据提示输入Real Name, Email, Password等信息，生成pub公钥和sub私钥

pub后面的一长串就是GPG Key ID，例如为9639D****92E4A，复制它，然后
```sh
gpg --armor --export 9639D****92E4A
```
会生成
```txt
-----BEGIN PGP PUBLIC KEY BLOCK----- 
<!-- your GPG key ID here -->
-----END PGP PUBLIC KEY BLOCK-----
```
进入github settings，添加到New GPG key，复制上方所有内容，粘贴后add GPG key

再配置本地git
```sh
git config --global user.signingkey 9639D****92E4A
git config --global commit.gpgsign true
```

## FAQ
## Q1: `git pull`提示
```txt
fatal: Not possible to fast-forward, aborting.
```
原因是本地版本较老，且commit了新内容，加上--rebase即可，如：
```sh
git pull origin master --rebase
```
## Q2: `git pull`提示
```txt
error: cannot pull with rebase: You have unstaged changes.
error: please commit or stash them.
```
原因是本地有修改的内容没有commit，只需要commit一下之后再rebase即可

## Q3: `git merge somebranch` get conflicts
```txt
Auto-merging myfile.txt
CONFLICT (content): Merge conflict in myfile.txt
Automatic merge failed; fix conflicts and then commit the result.
```
这时需要打开文件myfile.txt进行手动修改，修改完之后
```sh
git add myfile.txt
git commit -m "your msg"
```

## Q4: 在somebranch执行`git rebase master` get conflicts
```txt
Auto-merging myfile.txt
CONFLICT (content): Merge conflict in myfile.txt
error: could not apply 65b67af... commit message
```
同Q3，也是手动修改myfile.txt里的冲突，修改完之后提交不用commit，而是
```sh
git add myfile.txt
git rebase --continue
```
如果需要fast-forward merge，切换到master再merge就行
```sh
git checkout master
git merge somebrach
```
