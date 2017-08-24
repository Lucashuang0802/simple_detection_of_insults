# simple_detection_of_insults

# Prerequisite:
- [Natural Language Toolkit](http://www.nltk.org/)
- [NumPy](http://www.numpy.org/)
- [scikit](http://scikit-learn.org/)

# Tool
- [GraphLab Create](https://turi.com/)

# A positive example
1. Issue `cd /positive-example` command in ***Terminal*** to go to the `positive-example` folder
2. See the result and check two things:
    - cross validation accuracy
    - test data accuracy

----------------------------------------------------------------------------------------------------------------------

# Prerequisite:
- [MatLab](https://www.mathworks.com/) or [Octave](https://www.gnu.org/software/octave/)
- [Natural Language Toolkit](http://www.nltk.org/)
- [NumPy](http://www.numpy.org/)
- [Pandas](http://pandas.pydata.org/)

# A negative example
1. Issue `cd /negative-example` command in ***Terminal*** to go to the `negative-example` folder
2. Issue `python main.py` command to export `all.csv` and `punctuationOnly.csv`
    - `all.csv` contains punctuation, ratio of words and characters that are capitalized in total three features
    - `punctuationOnly.csv` contains punctuation feature
3. In `main.m`, you can either use `all.csv` or `punctuationOnly.csv` to train the model
4. Use [MatLab](https://www.mathworks.com/) or [Octave](https://www.gnu.org/software/octave/) to run `main.m`
5. See the result and check two things:
    - see if the cost function converges
    - evaluate accuracy
