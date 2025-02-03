import re, strutils  # ознакомьтесь с функцией findAll библиотеки re


var text = """English texts for b3ginners to practice read7ng and comprehension online & for fre3. Pr4acticing your comprehension a | of a written En9lish will both improve your vocabulary and understanding of gramma2r and word order; The texts below are des1gned to help you develop: while giving you an instant evaluation of your progre5s."""
# Ниже произведите действия над переменной text
var schars, counter, numbers: int

schars = 0
counter = 0
numbers = 0

for c in text:
    if c in {'.', ',', ':', ';', '!', '?', '"', '\'', '#', '$', '%', '&', '@', '(', ')', '[', ']', '+', '-', '*', '/', '\\', '=', '>', '<', '-', '_', '{', '}', ' ', '|'}:
        schars += 1

for c in text.toLowerAscii():
    if c == 'a':
        counter += 1

var numbersStr: string = ""
let digitPattern = re(r"\d+")
for match in text.findAll(digitPattern):
    numbersStr &= match

if numbersStr.len > 0:
    numbers = parseInt(numbersStr)

echo schars
echo counter
echo numbers


# Не изменяйте код ниже
doAssert schars == 57
doAssert counter == 18
doAssert numbers == 37349215