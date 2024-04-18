# Kanji and kana using vim on openbsd

Around one year ago I started learning Japanese.  Until now I procrastinated writing kanji with vim.
Finally the time has come to solve the issue.

First you need to install tyru/eskk.vim plugin with your preferred vim plugin manager.
With vim-plug you need to add the following code to your vimrc.

```
call plug#begin()
Plug 'tyru/eskk.vim'
call plug#end()
```

You can start using kana in insert mode after `<C-j>` and switching between katakana and hiragana
with `<q>`

After installation (:PlugInstall) you already have hiragana and katakana but kanji support is still
missing.  Fortunately *skk-jisyo-20201101* is available as a package.

```
pkg_add skk-jisyo-20201101
```

There's only one last step to solve.  Find out how to use hiragana to kanji translation with eskk.
In hiragana mode type in `;いぬ<space>`.  The result should be: 犬

仮名 と 漢字 お 畫くこと が できます。

