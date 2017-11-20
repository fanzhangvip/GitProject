1.请在自己的用户根目录下 然后建立一个.git_template的目录
2.然后在.git_template目录下建立hooks目录
3.然后吧commit-msg拷贝到hooks目录下
4.运行以下命令配置好 init.templatedir
git config --global init.templatedir .git_template目录的路径

需要注意的是上述操作会让你今后git clone的项目自动应用commit-msg的钩子
但如果已经clone下来了的项目，需要打开项目的.git/hooks目录
然后吧commit-msg.sample删除，然后吧commit-msg拷贝进去