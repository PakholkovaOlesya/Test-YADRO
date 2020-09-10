#! /bin/bash

#Создание журнала событий

log="$PWD/logs.txt"

create_log() {

if [ -f $log ]

then

	echo "Журнал событий уже существует"

else

	touch $log

fi

}

#Создать каталог

create_dir() {

echo "Введите имя нового каталога:"

read dir_name

if [ -z $dir_name ]

then 

	mkdir $dir_name 2>>$log

	echo "Введена пустая строка"

elif [ -d $dir_name ]

then 

	echo "Каталог с указанным именем уже существует"

	mkdir $dir_name 2>>$log

else

	mkdir $dir_name 2>>$log

	if [ -d $dir_name ]

	then
	
		echo "Каталог успешно создан"
	
	else 

		echo "Произошла ошибка при создании каталога"

	fi
fi

}

#Сменить текущий каталог

change_dir() {

echo "Введите путь к каталогу, в который надо перейти:"

read ch_direct

if [ -z $ch_direct ]

then 

	echo "Введена пустая строка" >>$log

	echo "Введена пустая строка"

elif [ -d $ch_direct ]

then

	cd $ch_direct 2>>$log

else

	cd $ch_direct 2>>$log

	echo "Каталог с именем $ch_direct не существует"

fi

if [ "$ch_direct" = "$PWD" ]

then

	echo "Вы перешли в каталог $ch_direct"

else

	echo "Произошла ошибка при переходе в требуемый каталог"

fi

}

#Напечатать содержимое текущего каталога

show_dir_files() {

ls -a $PWD

}

#Создать файл

create_file() {

echo "Введите имя нового файла:"

read file_name

if [ -z $file_name ]

then 

	touch $file_name 2>>$log

	echo "Введена пустая строка"

elif [ -f $file_name ]

then 

	echo "Файл с указанным именем уже существует" 

	echo "Файл с указанным именем уже существует" >>$log

else

	echo "Файл успешно создан"

	touch $file_name 2>>$log

fi

}

#Удалить файл

delete_file() {

echo "Введите имя файла, который требуется удалить"

read del_file

if [ -z $del_file ]

then 

	rm $del_file 2>>$log

	echo "Введена пустая строка"

elif [ -f $del_file ]

then

	rm $del_file 2>>$log

	if [ -f $del_file ]

	then

		echo "Произошла ошибка во время удаления файла"

	else

		echo "Файл успешно удален"

	fi

else

	rm $del_file 2>>$log

	echo "Файл с именем $del_file не существует"

fi

}

create_log

while :

do

echo "Введите номер:
   
1. Создать каталог

2. Сменить текущий каталог

3. Напечатать содержимое текущего каталога

4. Создать файл

5. Удалить файл

6. Выйти из программы"


	read key
	
	case $key in

		"1" )

			create_dir ;;

		"2" )

			change_dir ;;

		"3" )

			show_dir_files ;;

		"4" )

			create_file ;;

		"5" )

			delete_file ;;

		"6" )

			break ;;

		* )

			echo "Номер введен неверно, повторите ввод" ;;

	esac
	
done
		
