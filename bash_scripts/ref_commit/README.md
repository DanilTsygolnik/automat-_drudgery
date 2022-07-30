## Automate copying commit URL

Assume we want to reference several commits in a git project with several branches:
```
* 8e7077e (HEAD -> main, origin/main) Fix contact form validation error messages
* ...     ...
* fb6244d (origin/RFQ_form, RFQ_form) Show asterisks after labels of the required fields
* 55ee15f Fix error after submitting the form
* bb59c1e Link the Quote form
* ...     ...
```

To do so we just run the script inside any directory of the project:
```bash
cd ~/git_project/foo/bar

# Copy URL for the current HEAD position commit (8e7077e)
$ ref_commit.sh
$ xclip -selection clipboard -o  # print retrieved URL from clipboard
https://github.com/DanilTsygolnik/django_study_proj_01/commit/8e7077e861bcdd3478fe4f37d0962802a6e6922a

# Copy URL for the last commit in RFQ_form branch (fb6244d)
$ ref_commit.sh RFQ_form

# Copy URL for the HEAD~2 position commit in RFQ_form branch (bb59c1e)
$ ref_commit.sh RFQ_form~2
```

Add the following line in your `~/.bashrc` to run the script from any directory as shown in example:
```bash
export PATH=$PATH:/full/path/to/dir_with_script
```

After that it is also convenient to add several aliases to work faster:
```bash
# copy to clipboard
alias ccb='xclip -selection clipboard'
# get the value from clipboard
alias gcb='xclip -selection clipboard -o'
# run the script
alias rc='ref_commit.sh'
```
