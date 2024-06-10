"""Scripts para proyecto taller"""

import re

letters = {'a':'61',
           'b':'62',
           'c':'63',
           'd':'64',
           'e':'65',
           'f':'66',
           'g':'67',
           'h':'68',
           'i':'69',
           'j':'6A',
           'k':'6B',
           'l':'6C',
           'm':'6D',
           'n':'6E',
           'o':'6F',
           'p':'70',
           'q':'71',
           'r':'72',
           's':'73',
           't':'74',
           'u':'75',
           'v':'76',
           'w':'77',
           'x':'78',
           'y':'79',
           'z':'7A',
           ' ':'20',
           '$':'24',
           }

mem = []

SENTENCE = ('lorem ipsum dolor sit amet, consectetur adipiscing elit. aliquam ut fringilla ipsum, eu volutpat sapien. aliquam bibendum, leo ut sagittis pharetra, nulla est sagittis dui, in tincidunt arcu odio commodo mi. mauris vestibulum eu tortor at aliquam. nullam luctus pulvinar euismod. proin lobortis laoreet ligula ultrices venenatis. duis tincidunt elit id quam varius, non pellentesque turpis aliquam. mauris et consequat felis, vel convallis dui. donec ornare, odio sit amet tincidunt lobortis, ex ex suscipit arcu, non ornare justo mauris vitae augue. aliquam quis consequat elit. integer ac massa ac purus tincidunt pellentesque id vitae diam. proin dapibus porttitor mauris nec.')

def ram_gen(sentence):
  """Genera caracteres ASCII"""
  #sub = 0
  for letter in sentence:
    if letter not in ('.', ','):
          mem.append(letters[letter])

def dimensions_calc(val_ini):
  """Calcula dimensiones"""
  if val_ini < (16 * 7):
    print(val_ini)
    dimensions_calc(val_ini + 8)

def text_copy_aux(n):
  """Funcion auxiliar a textcopy"""
  line = 'txtArray[N] ? {8{pixelOnArr[N]}}:'
  line = re.sub('N', str(n), line)
  print(line)

def text_copy():
  """Genera valores"""
  for i in reversed(range(558, 658)):
    text_copy_aux(i)

MEM_SIZE = 656

ram_gen(SENTENCE)

i = 0

for code in mem:
   print(i, "   :   " + code + ";")
   i += 1

