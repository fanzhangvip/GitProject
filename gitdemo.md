### 1. git安装
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
------
------
# Trunk-based development 和 git flow


