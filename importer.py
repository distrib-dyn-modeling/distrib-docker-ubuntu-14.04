from __future__ import print_function, division, absolute_import

import sys
import os
import random
import warnings
import importlib
import json

__default_plotting_engine = 'matplotlib'

# enable fixes for Spyder (no Plotly support, no Agg support)
if any('SPYDER' in name for name in os.environ):
    SPYDER = True
else:
    SPYDER = False

import antimony
import matplotlib
if not SPYDER:
    matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
from numpy.linalg import svd
