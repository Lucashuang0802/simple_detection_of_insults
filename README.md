# simple_detection_of_insults

# Prerequisite:
- [MatLab](https://www.mathworks.com/) or [Octave](https://www.gnu.org/software/octave/)
- [Natural Language Toolkit](http://www.nltk.org/)
- [NumPy](http://www.numpy.org/)
- [Pandas](http://pandas.pydata.org/)

# A negative example
1. Issue `python main.py` command in *Terminal* to export `all.csv` and `punctuationOnly.csv`
  - `all.csv` contains punctuation, ratio of words and characters that are capitalized in total three features
  - `punctuationOnly.csv` contains punctuation feature
2. In `main.m`, you can either use `all.csv` or `punctuationOnly.csv` to train the model
3. Use [MatLab](https://www.mathworks.com/) or [Octave](https://www.gnu.org/software/octave/) to run `main.m`
4. See the result and check two things:
  - see if the cost function converges
  - evaluate accuracy
