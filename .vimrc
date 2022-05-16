" БАЗОВАЯ КОНФИГУРАЦИЯ

"       Внешний вид
syntax on                   " Подсвечивать синтаксис
set number                  " Нумирация строк
set cursorline              " Подсветка строки с курсором
set foldcolumn=0            " Количество отступов от края в символах
set textwidth=75            " Ограничение длинны строки в символах
set wrap linebreak nolist   " Перенос строки не по символам а по словам

"       Настройка навигационных клавиш
"   Заменяем стандартную связку клавиш навигаций hjkl на jkl; для того, чтобы
"   отправной клавишей стала j, на которой распологается выпуклость
noremap ; l
noremap l k
noremap k j
noremap j h
"   Создаем комбинацию <Alt-{j,k,l,;}> для навигации в режиме вставки
execute "set <M-j>=\033j"
execute "set <M-k>=\033k"
execute "set <M-l>=\033l"
execute "set <M-;>=\033;"
"   Привязываем назначенные комбинации к стрелочкам
imap <M-j> <left>
imap <M-k> <down>
imap <M-l> <up>
imap <M-;> <right>

"       Настройка функциональных клавиш
"   Создаем комбинацию <Alt-d> для удаления одного символа до курсора
execute "set <M-d>=\033d"
"   Привязываем комбинацию для работы в режиме вставки
imap <M-d> <backspace>
"   Создаем комбинацию <Alt-f> для того чтобы ей продублировать <Enter>
execute "set <M-f>=\033f"
"   Привязываем комбинацию для обычного режима и режима вставки
map <M-f> <CR>
imap <M-f> <CR>

"       Настройка клавиши TAB
set expandtab       " Замена TAB на пробела
set tabstop=4       " Количество пробелов в одном TAB
set softtabstop=4   " Размер стека пробелов удаляемых одним нажатием <backspace>
set smarttab        " При нажатии TAB в начале строки добавится $shiftwidth пробелов
set shiftwidth=4    " Столько пробелов добавиться в $smarttab

"       Настройка Русской раскладки
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"       Настройка комбинаций для взаимодействия с файлом
"   Сохранить изменения в файл
map <C-s> :w<CR>
imap <C-s> <esc>:w<CR>a
"   Закрыть файл и текущую сессию
map <C-x> :q!<CR>
imap <C-x> :q!<CR>

" ПЛАГИНЫ И ВЗАИМОДЕЙСТВИЕ С НИМИ (НЕ ОБЯЗАТЕЛЬНАЯ ЧАСТЬ КОНФИГУРАЦИИ)

"       Загрузка плагинов
"   В качестве менеджера плагинов используем Vim-Plug https://github.com/junegunn/vim-plug
"   Ниже список подгружаемых плагинов
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}         " Всплывающие окна с подсказками
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}    " Навигация по файловой системе с интерфейсом древа
Plug 'morhetz/gruvbox'                                  " Цветовая схема
Plug 'jiangmiao/auto-pairs'                             " Парные ковычки и скобочки
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}        " Правописание Go

call plug#end()

"       morhetz/gruvbox
colorscheme gruvbox " Устанавливаем плагин как цветовую схему
set background=dark " Выбираем вариацию

"       scrooloose/nerdtree
"   Назначаем новую комбинацию клавиш <Alt-t>
execute "set <M-t>=\033t"
"   Привязываем новую комбинацию к команде построения древа файловой
"   системы
map <C-n> :NERDTreeToggle<CR>

"       fatih/vim-go
"   Привязываем клавиши к команде go run
map <C-c> :GoRun<CR>
imap <C-c> <esc>:GoRun<CR>
