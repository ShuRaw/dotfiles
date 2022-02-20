import glob
import os
import shutil

USER = os.environ.get("USER")
HOME = f"/home/{USER}"
CONFIG = f"{HOME}/.config"
VIM_HOME = f"{CONFIG}/nvim"
VIM_CONFIG = f"{VIM_HOME}/init.vim"
AFTER_HOME = f"{VIM_HOME}/after"
LUA_HOME = f"{VIM_HOME}/lua"
IS_TEST = False


def mock_symlink(file, link):
    print(f'Creating symlink "{link}" to file "{file}"')


def mock_mkdir(folder):
    print(f'Making folder "{folder}"')


def mock_remove(file):
    print(f'Deleting file "{file}"')


def mock_rmtree(folder):
    print(f'Deleting recursive folder "{folder}"')


if IS_TEST:
    os.symlink = mock_symlink
    os.remove = mock_remove
    shutil.rmtree = mock_rmtree
    os.mkdir = mock_mkdir

for filepath in glob.iglob(f"{HOME}/dotfiles/config/.*"):
    filename = filepath.split("/")[-1]
    try:
        dotfile = f"{HOME}/{filename}"
        print(f"Creating symlink: {filename}")

        if os.path.exists(dotfile):
            os.remove(dotfile)
        os.symlink(filepath, dotfile)
    except Exception as exception:
        print(exception)

for filepath in glob.iglob(f"{HOME}/dotfiles/config/*"):
    filename = filepath.split("/")[-1]
    try:
        dotfile = f"{VIM_HOME}/{filename}"
        print(f"Creating symlink: {filename}")

        if os.path.exists(dotfile):
            os.remove(dotfile)
        os.symlink(filepath, dotfile)
    except Exception as exception:
        print(exception)

if os.path.exists(VIM_CONFIG):
    os.remove(VIM_CONFIG)
print("Creating file: init.vim")
os.symlink(f"{HOME}/dotfiles/config/init.vim", VIM_CONFIG)

if os.path.exists(AFTER_HOME):
    shutil.rmtree(AFTER_HOME)
print("Creating folder: ftplugin")
os.mkdir(AFTER_HOME)
os.symlink(f"{HOME}/dotfiles/ftplugin", f"{AFTER_HOME}/ftplugin")

# if os.path.exists(SNIP_HOME):
#     shutil.rmtree(SNIP_HOME)
# print("Creating folder: ultisnips")
# os.symlink(f"{HOME}/dotfiles/ultisnips", SNIP_HOME)

if os.path.exists(LUA_HOME):
    os.remove(LUA_HOME)
print("Creating folder: lua")
os.symlink(f"{HOME}/dotfiles/lua", LUA_HOME)
