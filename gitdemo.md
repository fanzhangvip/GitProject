### 1. git安装
* tortoisegit
### 2. git配置
* 用户信息\
  `git config --global user.name "fanzhang"`\
  `git config --global user.email "fanzhang@yunnex.com"`
* 文本编辑器\
  `git config --global core.editor notepad`
* 查看配置信息\
  `git config --list`
* 配置git注释模板\
 `git config –global commit.template ./commit_template`
* Git SSH配置\
  `ssh-keygen -t rsa -C "fanzhang@yunnex.com"`
### 3. git使用流程
![](./image/git1.png) 
### 4. 本地代码与服务器代码的关系
![](./image/git2.png)
### 5. git提交代码流程
![](./image/git3.png)
### 6. git常用命令
1. 取代码
    * 第一次取代码\
    `git clone git@github.com:fanzhangvip/GitProject.git`
    * 再次取\
      `git pull <分支>`\
      冲突`git checkout   <冲突文件>`
2. git代码提交命令\
    `git add <修改文件>`\
    `git commit /git commit –a(慎用)`\
    `git push  [分支]可选`\
    另:
      ```
      git diff ,git diff --cached
      git reset  HEAD <文件路径>,git commit –amend,
      git reset --HARD <hashcode>
      ```
3. 分支的相关命令
    ```
    git branch –a  查看服务器分支
    git branch        查看本地分支
    git checkout <服务器分支>  -b  <本地分支>

    //建立本地分支，并切换到对应的分支
    git checkout <分支 >    本地已存在分支切换，主分支 master
    git branch –D  <分支名>  删除本地分支

    git push/pull origin <分支名>  推送和拉代码
    git cherry –pick <hashcode>  将另一分支的提交合入到本分支
    ```
4. 其他常用命令
    ```
    git log 查看日志
    git log --author=fanzhang 查询指定提交人的日志
    git log --grep=“bugId”
    git log <文件路径>
    git log --graph
    可组合使用，如
    git log --author=fanzhang  app/src/main/
    git show [hashcode]  [文件路径] 显示具体的修改
    如：git show 016e78
    git diff  [文件路径] 对比代码的不同点（本地修改与服务器）
    git diff --cached 本地commit后,未push时查看

    git blame –l –L 行号   文件名   //查询指定文件某行的提交记录
    git log [--before=“2012-08-09”] [--after=“XXX”]
            [--since=“XX”]
    git merge 把一个分支或或某个commit的修改合并到现在的分支上
              [--no-ff ] 禁用fast-farward
              [--squash] 本地文件内容与不使用该选项的合并结果相同，
              但是不保留待合并分支上的历史信息，也不提交、不移动HEAD，因此需要一条额外的commit命令

    git stash 可以把当前工作现场“储藏”起来，等以后恢复现场后继续工作
    git stash list
    git stash apply恢复，但是恢复后，stash内容并不删除，你需要用git stash drop来删除
    git stash pop，恢复的同时把stash内容也删了
    ```
### 7.冲突解决
1. 拉代码冲突
    ```
    git pull 时冲突，无法更新代码
    git  checkout <冲突文件>
    git checkout -f  强制
    ```
2. 提交冲突
    ```
    冲突原因:在同一文件中，其他人已提交了修改
    较为规范提交步骤: git add, git commit , git pull ,git push
    解决办法：先checkout 本地代码，再pull，再修改提交

    git cherry-pick 冲突，手动修改
    ```
### 8. *最牛逼的技能git status*
其他学习资料推荐:[廖雪峰的官方网站](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)

------
------
# Trunk-based development 和 git flow
[rdc最佳实践之开发模式——git flow](https://yq.aliyun.com/articles/137035)\
[深入理解学习Git工作流](https://segmentfault.com/a/1190000002918123)

# 最后Markdown语法
* [Markdown 语法说明](http://www.appinn.com/markdown/)
* 插件推荐：Markdown Navigator 2.0

# git使用常见问题
1. git无法pull仓库refusing to merge unrelated histories\
    `git pull origin master --allow-unrelated-histories`
2. 如果你在add时遇到unable to stat ... Filename too long 这个问题时\
    `git config --system core.longpaths true`
3. git 乱码问题
    ```
    在cygwin中，使用git add添加要提交的文件的时候，如果文件名是中文，会显示形如274\232\350\256\256\346\200\273\347\273\223.png的乱码。
    解决方案：
    在bash提示符下输入：

    git config --global core.quotepath false
    core.quotepath设为false的话，就不会对0×80以上的字符进行quote。中文显示正常

    设置git gui的界面编码

    git config --global gui.encoding utf-8
    设置 commit log 提交时使用 utf-8 编码，可避免服务器上乱码，同时与linux上的提交保持一致！

    git config --global i18n.commitencoding utf-8
    git config --global i18n.logoutputencoding gbk
    ```
4. git合并产生备份文件\
    `git config --global mergetool.keepBackup false`
5. git 配置比较 合并工具
    ```
    # 差异工具配置
    git config --global diff.external git-diff-wrapper.sh
    git config --global diff.tool tortoise
    git config --global difftool.tortoise.cmd 'TortoiseMerge -base:"$LOCAL" -theirs:"$REMOTE"'
    git config --global difftool.prompt false

    # 合并工具配置
    git config --global merge.tool tortoise
    git config --global mergetool.tortoise.cmd 'TortoiseMerge -base:"$BASE" -theirs:"$REMOTE" -mine:"$LOCAL" -merged:"$MERGED"'
    git config --global mergetool.prompt false

    # 别名设置
    git config --global alias.dt difftool
    git config --global alias.mt mergetool

    配置 p4Merge
    [merge]
        tool = p4merge
    [mergetool "p4merge"]
        cmd = D:/zero/p4/p4merge.exe "$BASE" "$LOCAL" "$REMOTE" "$MERGED"
        trustExitCode = false
    [diff]
        tool = p4merge
    [difftool]
        cmd = D:/zero/p4/p4merge.exe "$LOCAL" "$REMOTE"
    [mergetool]
        keepBackup = false
    ```
6. 删除git在本地的无效远程分支
    ```
    远程已经删除的分支，在本地执行  git  branch  -a 显示还存在，执行以下命令可以清除
    git remote prune origin
    ```