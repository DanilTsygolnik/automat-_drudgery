## Скрипт для создания ежедневных заметок

Команда `make_day_note $filename $note_directory $note_template`

Возможные случаи:
1. `make_day_note`
2. `make_day_note $filename`
3. `make_day_note $filename $note_directory`
4. `make_day_note $filename $note_directory $note_template`

Псевдокод:
```
Считать аргументы...

Проверяем первый аргумент $filename:
- если нет, то дефолтное значение -- из date
- если есть, то назначаем переданное значение

Проверяем второй аргумент $note_directory:
- если нет, то дефолтное значение $PWD
- если есть, то назначаем переданное значение

Создаём переменную $day_note_full_path

Проверяем, существует ли $day_note_full_path:
- если существует, то открыть дефолтным редактором ($EDITOR ?)
- иначе создать пустой файл и проверяем $template:
    - если $template существует, то передаём содержимое в файл $day_note_full_path

Проверяем третий аргумент $template:
- иначе сразу открываем файл $day_note_full_path
```

Неудачная последовательность аргументов, лучше такая ([commit](https://github.com/DanilTsygolnik/automate_drudgery/commit/a616f5c1660d21a31b90eb05f0d3d7a053b28dac)):    
`make_day_note $note_template $note_directory $filename`


## Tests

`make_day_note` -- пустая заметка по дате в текущей директории либо открыть существующий файл ++
`make_day_note $note_template` -- заметка с содержимым шаблона в текущей директорией с названием по дате либо открыть существующий файл (шаблон игнорируется) ++

`make_day_note $note_template $note_directory` -- заметка с содержимым шаблона в заданной директорией с названием по дате \* валидация директории и создание
    + `bash make_day_note.sh "" ./test` (создаётся пустая заметка с названием по дате в существующей директории; при повторном вызове открывается соотв. заметка)
    - `bash make_day_note.sh "" ./test` (создаётся пустая заметка с названием по дате в существующей директории; при повторном вызове открывается соотв. заметка) -- нужно создавать директории (решено ([commit](https://github.com/DanilTsygolnik/automate_drudgery/commit/8b74e0e8ffc5ae59599d389b8167086ace321e1c))) 
`make_day_note $note_template $note_directory $filename` -- заметка с содержимым шаблона в заданной директорией с заданным названием ++
