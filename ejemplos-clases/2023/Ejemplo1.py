# -*- coding: utf-8 -*-
"""
Created on Tue Sep 12 20:53:51 2023

@author: aghersin
"""

#import os

#import numpy as np
import matplotlib.pyplot as plt

import control as ct

#from control import tf, mixsyn, feedback, step_response

s = ct.tf([1, 0], 1)
# the plant
g = 200/(10*s + 1) / (0.05*s + 1)**2
# disturbance plant
gd = 100/(10*s + 1)

plt.figure(1);
ct.bode_plot(g, plot=True);
plt.figure(3)
ct.root_locus(g);
plt.figure(2);5
ct.nyquist_plot(g);