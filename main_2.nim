import sequtils, strutils, os  # Все нужные библиотеки уже подключены
import utils  # Рекомендуем ознакомиться для выполнения задания :)

const RootDir = "folder"
# Ниже реализуйте требуемую задачу
var dirs, files, exts: seq[string]

proc traverse(path: string) =
    for kind, path in walkDir(path):
        if kind == pcDir:
            dirs.add(path.replace(" ", "_"))
            traverse(path)
        elif kind == pcFile:
            let fileName = path.extractFilename()
            files.add(fileName)
            let ext = splitFile(fileName).ext
            if ext.len > 0:
                exts.add(ext)

dirs.add(RootDir.replace(" ", "_"))
traverse(RootDir)

#echo dirs
#echo files
#echo exts

# Не изменяйте код ниже
import sets
doAssert(
    len(@["folder/f_4/ff1", "folder/f_3/ff1", "folder/f_5", "folder/f_5/ff1", "folder/f_8", "folder/f_1", "folder/f_3", "folder", "folder/f_3/ff2", "folder/f_4", "folder/f_7", "folder/f_2", "folder/f_4/ff_2", "folder/f_6", "folder/f_9"].toHashSet - dirs.toHashSet) == 0 or
    len(@["folder\\f_4\\ff1", "folder\\f_3\\ff1", "folder\\f_5", "folder\\f_5\\ff1", "folder\\f_8", "folder\\f_1", "folder\\f_3", "folder", "folder\\f_3\\ff2", "folder\\f_4", "folder\\f_7", "folder\\f_2", "folder\\f_4\\ff_2", "folder\\f_6", "folder\\f_9"].toHashSet - dirs.toHashSet) == 0
)
doAssert len(@["file.4.some", "ff1.txt", "1.dat", "ff2.ext", "f3.text", "123.klm", "file.1.txt", "file.1.txt", "file.3.txt", "file.1.txt", "file.2.txt", "file 2.txt"].toHashSet - files.toHashSet) == 0
doAssert len(@[".some", ".txt", ".dat", ".txt", ".txt", ".txt", ".txt", ".text", ".klm", ".txt", ".ext", ".txt"].toHashSet - exts.toHashSet) == 0
