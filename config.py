import glob
import os
import shutil

USER = os.environ.get('USER')
HOME= f'/home/{USER}'
VIM_HOME = f'{HOME}/.vim'
AFTER_HOME = f'{VIM_HOME}/after'
SNIP_HOME = f'{VIM_HOME}/UltiSnips'

for filepath in glob.iglob(f'{HOME}/dotfiles/config/.*'):
    filename = filepath.split('/')[-1]
    try:
        dotfile = f'{HOME}/{filename}'
        if os.path.exists(dotfile):
            os.remove(dotfile)
        os.symlink(filepath, dotfile)
    except Exception as exception:
        print(exception)

if os.path.exists(AFTER_HOME):
    shutil.rmtree(AFTER_HOME)
os.mkdir(AFTER_HOME)
os.symlink(f'{HOME}/dotfiles/ftplugin', f'{AFTER_HOME}/ftplugin')

if os.path.exists(SNIP_HOME):
    shutil.rmtree(SNIP_HOME)
os.symlink(f'{HOME}/dotfiles/UltiSnips', SNIP_HOME)
