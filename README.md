# AutoEsc
A Vim plugin for automatically reverting to Normal mode after a specified period of inactivity.

# install 
Copy AutoEsc.vim to the Vim installation path ./plugin. 

# configure
Edit your ~/.vimrc and add the following lines:
```
  let autoEscTime = 3
```
or
```
  let g:autoEscTime = 3
```
If g:autoEscTime is less than 1000, autoEscTime is in seconds.
If g:autoEscTime is 1000 or more, autoEscTime is in milliseconds.

# Hot Modification
To set the auto-escape time, use the command:
```
:SetAutoEscTime 2
```
# Test

You can also directly open AutoEsc.vim with Vim, and then enter the following command in command mode:
```
:source %
```
This will allow you to test it without installing; the changes will automatically expire when you close Vim.
