import numpy as np
import matplotlib.pyplot as plt

x = np.array([-1, 0, 1, 2])
y = np.array([4, 2, 1, 0])

A = np.vstack([x, np.ones(len(x))]).T
m, c = np.linalg.lstsq(A, y, rcond=None)[0]

plt.plot(x, y, 'o', label='Original data', markersize=10)
plt.plot(x, m*x + c, 'r', label='Fitted line')
plt.show()