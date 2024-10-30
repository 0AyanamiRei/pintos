import numpy as np

# 系数矩阵
A = np.array([[66638.76, 14716.66],
              [193972.36, 2689.16]])

# 常数项
B = np.array([31316.13, 22839.06])

# 求解线性方程组
k, m = np.linalg.solve(A, B)

print(f"k = {k}, m = {m}")