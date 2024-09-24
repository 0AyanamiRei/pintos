以32位有符号整数为例。

### 用整数模拟浮点数

`a p.q`格式。


`17.14` 用32位的低14位作为实数的小数部分，用32位的15~31位作为实数的整数部分，最高位用作符号位。

用f表示2^14.

#### 类型的转换

1. 整数转换为浮点数:整数左移14位即可。

2. 浮点数转换为整数:
- 若浮点数为正数,则:`(x + f / 2) / f`
- 若浮点数为负数,则`(x - f / 2) / f`

为何如此?
由于`/`运算符向零取整,我们应该尽可能保证其浮点数的值接近得到的整数,因此做此处理。

#### 浮点数相关的运算

用`r`表示实数,`i`表示整数

1. 加法
- r + r 则`r + r`
- r + i 则`r + i * f`

2. 减法
- r-r 则`r - r`
- r-i 则`r - i * f`

3. 乘法
- r*r 则`(((int64_t))r * r) / f`
为何进行类型转换?    answer:32位数和32位数相乘最大值可达到64位的结果,所以进行类型转换防止数据丢失。
为何/f?             answer:两个14位小数部分的实数相乘之后结果应该达到了28位的小数部分的实数,我们需要的结果是14位。
- r*i 则`r * i`

4. 除法
- r/r 则`((int64_t) r) * f / r `
问题同上述类似。
- r/i 则`r / i`


本节一直使用f乘法或除法，而不是q位移位，原因有二。
1. 首先，乘法和除法没有C移位运算符的令人惊讶的运算符优先级。
2. 其次，乘法和除法在负操作数上定义良好，但C移位运算符没有。在实现中注意这些问题。



#### 完整运算图


- Convert n to fixed point: `n * f`

- Convert x to integer (rounding toward zero): `x / f`

- Convert x to integer (rounding to nearest): 
  - `(x + f / 2) / f`  if `x >= 0`,
  - `(x - f / 2) / f`  if `x < 0`.

- Add x and y: `x + y`

- Subtract y from x: `x - y`

- Add x and n: `x + n * f`

- Subtract n from x: `x - n * f`

- Multiply x by y: `((int64_t) x) * y / f`

- Multiply x by n: `x * n`

- Divide x by y: `((int64_t) x) * f / y`

- Divide x by n: `x / n`
