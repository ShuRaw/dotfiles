import glob
import os

USER = os.environ.get('USER')
HOME= f'/home/{USER}'
VIM_HOME = f'{HOME}/.vim'

for filepath in glob.iglob(f'{HOME}/dotfiles/config/.*'):
    filename = filepath.split('/')[-1]
    try:
        dotfile = f'{HOME}/{filename}'
        if os.path.exists(dotfile):
            os.remove(dotfile)
        os.symlink(filepath, dotfile)
    except Exception as exception:
        print(exception)

os.mkdir(f'{VIM_HOME}/after')
os.symlink(f'{HOME}/dotfiles/ftplugin', f'{VIM_HOME}/after/ftplugin')
