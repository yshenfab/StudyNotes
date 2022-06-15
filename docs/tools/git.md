
# Table of Contents

1.  [git config](#org1cc4f5f)
2.  [SSH](#org10c4877)
    1.  [生成和添加key](#org182f974)
    2.  [验证](#orgd926085)
3.  [GPG](#orga4a33ae)
    1.  [生成GPG Key](#org55e1252)
4.  [basic usage](#orgfade340)



<a id="org1cc4f5f"></a>

# git config

refer to dotfiles repo


<a id="org10c4877"></a>

# SSH


<a id="org182f974"></a>

## 生成和添加key

ssh-keygen -t rsa -b 4096 -C "xxxxxx@qq.com"
复制~/.ssh/id<sub>rsa.pub的内容里</sub>（也就是key）
进入github settings，添加到New SSH key


<a id="orgd926085"></a>

## 验证

ssh -T git@github.com
如果看到You've successfully authenticated, but GitHub does not provide shell access表明成功


<a id="orga4a33ae"></a>

# GPG


<a id="org55e1252"></a>

## 生成GPG Key

gpg &#x2013;gen-key
要求输入Real Name: FirstName LastName，Email: xxxxxxx@qq.com以及密码
生成pub公钥，sub私钥
pub后面的一长串就是GPG Key ID，例如为9639D\*\*92E4A，复制它，然后
gpg &#x2013;armor &#x2013;export 9639D\*\*92E4A
会生成
&#x2013;&#x2014;BEGIN PGP PUBLIC KEY BLOCK&#x2013;&#x2014; 
<!&#x2013; your GPG key ID here &#x2013;>
&#x2013;&#x2014;END PGP PUBLIC KEY BLOCK&#x2013;&#x2014;
进入github settings，添加到New GPG key，复制上方所有内容，粘贴后add GPG key
再配置本地git：
git config &#x2013;global user.signingkey 9639D\*\*92E4A
git config &#x2013;global commit.gpgsign true


<a id="orgfade340"></a>

# basic usage

git init
git add <file> / git add .
git commit -m "message"
git remote add origin <https://github.com/yshenfab/repo_name.git>
git push origin master

