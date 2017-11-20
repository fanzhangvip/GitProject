chdir %userprofile%
mkdir .git_template
chdir .git_template
mkdir hooks
cd ..
copy commit-msg %userprofile%\.git_template\hooks
