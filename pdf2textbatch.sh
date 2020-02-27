# find .        Busca en el directorio actual.
# -name "*"     Busca todos los archivos
# -type         de tipo 
# f             file
# d             directory
# |             pipe
# sort -n -r    ordena con opcion -n -r
# while         mientras lea todos los parametros de find

VERDE="\033[47m\033[0;32m\a"
ROJO="\033[47m\033[0;31m\a"
ROJOCLARO="\033[47m\033[0;31m"
ROSA="\033[47m\033[0;35m"
ROSAFONDONEGRO="\033[40m\033[1;35m"
CYAN="\033[40m\033[36m"
AMARILLO="\033[47m\033[0;33m\a"
BLANCO="\033[1;37m"

find . -name "*.pdf" -type f | sort -n -r | while read all_pdf_files    
    do
        echo "Primero renombraremos archivos para evitar problemas"
        echo "archivos sin espacios, guiones bajos y de mayusculas a minisculas"
        files_pdf_procesados=`echo $all_pdf_files | tr ' ' '-' | tr '_' '-' | tr '[A-Z]' '[a-z]'`
        if [ $files_pdf_procesados == $all_pdf_files ]
        then
            echo "$CYAN $all_pdf_files ya esta procesado ... sin cambios"
        else
            mv "$all_pdf_files" "$files_pdf_procesados"
            echo "renombrando archivo: $VERDE $all_pdf_files a $ROJO $files_pdf_procesados"
        fi
    done

#Convirtiendo pdf a texto

find . -name "*.pdf" -type f | sort -n -r | while read all_pdf_files
		do
				echo -e "convirtiendo $all_pdf_files a txt"
				pdftotext -layout $all_pdf_files 
    done

