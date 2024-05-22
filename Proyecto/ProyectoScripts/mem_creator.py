"""Scripts para proyecto taller"""

import re

letters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p',
           'q','r','s','t','u','v', 'w','x','y','z', ' ']

mem = []

SENTENCE = ('lorem ipsum dolor sit amet, consectetur adipiscing elit.'
            'aliquam ut fringilla ipsum, eu volutpat sapien. aliquam'
            'bibendum, leo ut sagittis pharetra, nulla est sagittis'
            'dui, in tincidunt arcu odio commodo mi. mauris'
            'vestibulum eu tortor at aliquam. nullam luctus pulvinar'
            'euismod. proin lobortis laoreet ligula ultrices'
            'venenatis. duis tincidunt elit id quam varius, non' 
            'pellentesque turpis aliquam. mauris et consequat felis,'
            'vel convallis dui. donec ornare, odio sit amet tincidunt' 
            'lobortis, ex ex suscipit arcu, non ornare justo mauris'
            'vitae augue. aliquam quis consequat elit. integer ac' 
            'massa ac purus tincidunt pellentesque id vitae diam.'
            'proin dapibus porttitor mauris nec.')

def ram_gen(sentence):
  """Genera caracteres ASCII"""
  #sub = 0
  for letter in sentence:
      #if letter == ' ':
      #    mem.append([])
      #    sub += 1

    if letter not in ('.', ','):
      for i in letters:
        if letter == i:
          mem.append(letters.index(i))

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

for j in range(MEM_SIZE):
  print(MEM_SIZE - 78)
  MEM_SIZE -= 78
