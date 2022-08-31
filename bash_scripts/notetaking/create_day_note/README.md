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

## tbs

### Тайминги

Прикидка на бумаге - 00:12
Черновик README ([commit](https://github.com/DanilTsygolnik/automate_drudgery/commit/aa04317095e76ee5db452bf6137ff77a712aa61d)) - 00:20

Кодирование: ([commit](https://github.com/DanilTsygolnik/automate_drudgery/commit/937c40cb53ea73a63e02748ce7dd111c6fea33f5)) - 00:20

Уточнения на бумаге: template и валидация - 00:11

Кодирование ([commit](https://github.com/DanilTsygolnik/automate_drudgery/commit/b45ebbfd73821ad4751f09c4288546415fa84bc2)), ([commit](https://github.com/DanilTsygolnik/automate_drudgery/commit/6794d8664674b4627e99bb0ebb91a27263201508)), ([commit](https://github.com/DanilTsygolnik/automate_drudgery/commit/c9aef59d625b686803732cddb34bf42da8923048)) - 00:20

Тестирование - 00:05

Изменение кода ([commit](https://github.com/DanilTsygolnik/automate_drudgery/commit/a616f5c1660d21a31b90eb05f0d3d7a053b28dac)) и тестирование, правки ([commit](https://github.com/DanilTsygolnik/automate_drudgery/commit/8b74e0e8ffc5ae59599d389b8167086ace321e1c)) и окончание тестов - 00:28

Заметки - 00:30

### Использованные материалы

- [Bash cheatsheet](https://devhints.io/bash)
