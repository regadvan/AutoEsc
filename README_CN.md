# AutoEsc 简述
一个 VIM 插件，用于在进入插入模式、替换模式和视图模式后，指定时间无操作时，即退出到普通模式，这样将极大减少按 ESC 键的次数，操作 vim 更加方便和快捷。

# 安装 
复制 AutoEsc.vim 到 Vim 安装路径下的 ./plugin 文件夹中

# .vimrc 配置
编辑 ~/.vimrc 并添加如下行:
```
  let autoEscTime = 3
```
或
```
  let g:autoEscTime = 3
```
如果 g:autoEscTime 数值小于 1000, autoEscTime 值将被识别为秒.
如果 g:autoEscTime 数值大于 1000, autoEscTime 值将被识别为毫秒.

# 热配置
要实时修改配置，可以 vim 的命令行中输入如下命令，注意带有任何非数字字符时不会生效，只有全是数字时才会生效:
```
:SetAutoEscTime 2
```
# 测试

你可以用 vim 直接打开 AutoEsc.vim，然后在命令模式输入如下命令:
```
:source %
```
即可不安装而直接生效测试; 当然关闭 vim 之后即失效.
