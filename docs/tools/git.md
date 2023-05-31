# Git

## Config

Refer to [dotfiles](https://github.com/yshenfab/dotfiles/blob/master/git/.gitconfig).

## SSH

### ssh-keygen & add key

```sh
ssh-keygen -t rsa -b 4096 -C "email@domain"
```

进入 github settings，添加到 New SSH key

复制~/.ssh/id_rsa.pub 文件中的内容，粘贴过来

### Authentication

```sh
ssh -T git@github.com
```

如果看到 You've successfully authenticated, but GitHub does not provide shell access
表明成功

## GPG

### Generate GPG Key

```sh
gpg --gen-key
```

根据提示输入 Real Name, Email, Password 等信息，生成 pub 公钥和 sub 私钥

pub 后面的一长串就是 GPG Key ID，例如为 9639D\*\*\*\*92E4A，复制它，然后

```sh
gpg --armor --export 9639D****92E4A
```

会生成

```txt
-----BEGIN PGP PUBLIC KEY BLOCK-----
<!-- your GPG key ID here -->
-----END PGP PUBLIC KEY BLOCK-----
```

进入 github settings，添加到 New GPG key，复制上方所有内容，粘贴后 add GPG key

再配置本地 git

```sh
git config --global user.signingkey 9639D****92E4A
git config --global commit.gpgsign true
```

## FAQ

## Q1: `git pull`提示

```txt
fatal: Not possible to fast-forward, aborting.
```

原因是本地版本较老，且 commit 了新内容，加上--rebase 即可，如：

```sh
git pull origin master --rebase
```

## Q2: `git pull`提示

```txt
error: cannot pull with rebase: You have unstaged changes.
error: please commit or stash them.
```

原因是本地有修改的内容没有 commit，只需要 commit 一下之后再 rebase 即可

## Q3: `git merge somebranch` get conflicts

```txt
Auto-merging myfile.txt
CONFLICT (content): Merge conflict in myfile.txt
Automatic merge failed; fix conflicts and then commit the result.
```

这时需要打开文件 myfile.txt 进行手动修改，修改完之后

```sh
git add myfile.txt
git commit -m "your msg"
```

## Q4: 在 somebranch 执行`git rebase master` get conflicts

```txt
Auto-merging myfile.txt
CONFLICT (content): Merge conflict in myfile.txt
error: could not apply 65b67af... commit message
```

同 Q3，也是手动修改 myfile.txt 里的冲突，修改完之后提交不用 commit，而是

```sh
git add myfile.txt
git rebase --continue
```

如果需要 fast-forward merge，切换到 master 再 merge 就行

```sh
git checkout master
git merge somebrach
```
