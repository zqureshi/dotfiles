from fabric.api import task, with_settings, hide, local, lcd
from fabric.colors import red, green
from fabric.utils import fastprint

import os.path

## Files to link
## (source, path, target)
dotfiles = [
    ("vim", "", ".vim"),
    ("bashrc", "", ".bashrc"),
    ("gitconfig", "", ".gitconfig"),
    ("screenrc", "", ".screenrc"),
    ("ssh_config", ".ssh/", "config"),
    ("vimrc", "", ".vimrc"),
    ("zshrc", "", ".zshrc"),
]

## Error Codes
LN_FILE_EXISTS = 1

@task
@with_settings(hide('running', 'warnings', 'stdout', 'stderr'), warn_only=True)
def link(force=False):
  for filename, path, target in dotfiles:
    output = \
        local('ln {force} -s -T {dotfiles_dir}/{filename} ~/{path}{target}'\
          .format(force="-f" if force else "",
            path=path, filename=filename, dotfiles_dir=dotfiles_dir(),
            target=target))

    if output.return_code == LN_FILE_EXISTS:
      print('Skipping ' + red(path + target) + ' (already exists)')
    else:
      print('Linking ' + green(path + target) + (" (forced)" if force else ""))

def dotfiles_dir():
  return os.path.dirname(os.path.abspath(__file__))

