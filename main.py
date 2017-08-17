import nltk
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import csv

from nltk import ngrams

#uncomment this for debugging
# import pdb

data = pd.read_csv('train.csv', header=None)

N = len(data)

output1 = []
output2 = []

for i in range(1, N):
  text = data.iloc[i][2]
  text_token = nltk.word_tokenize(text)
  text_token_no_punc = []
  for token in text_token:
    if token.isalpha() == True:
      text_token_no_punc.append(token)
  result = int(data.iloc[i][0]) # because data.iloc[i][0] is str

  # feature 1: number of punctuation
  punctuationCount = sum(x.isalpha() == False for x in text_token)

  # feature 2: Capitalization in terms of characters
  total_char_count = sum(len(token) for token in text_token_no_punc)

  uppercase_char_count = 0
  for token in text_token_no_punc:
    uppercase_char_count += sum(1 for c in token if c.isupper())

  uppercase_char_ratio = 0
  if total_char_count != 0:
    uppercase_char_ratio = uppercase_char_count / float(total_char_count)

  # feature 3: Capitalization in terms of words
  total_word_count = len(text_token_no_punc)

  total_cap_word_count = 0
  for token in text_token_no_punc:
    for c in token:
      if c.isupper():
        total_cap_word_count += 1
        break

  uppercase_word_ratio = 0
  if total_word_count != 0:
    uppercase_word_ratio = total_cap_word_count / float(total_word_count)

  output1.append([punctuationCount, result])
  output2.append([punctuationCount, uppercase_char_ratio, uppercase_word_ratio, result])
  

df1 = pd.DataFrame(output1)
df1.to_csv("punctuationOnly.csv", index=False, header=None)
df2 = pd.DataFrame(output2)
df2.to_csv("all.csv", index=False, header=None)
  