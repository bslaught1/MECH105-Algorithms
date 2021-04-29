# Simpson's 1/3 Rule

Simpson's 1/3 rule is a numerical integration technique for equally spaced tabular data. This function uses a composite Simpson's 1/3 rule when there is an even number of intervals. If the number of intervals is odd, the composite Simpson's rule is applied for all intervals except for the last one, to which trapezoidal rule is applied.

### Inputs

- `x` - The independent variable vector
  - Values must be equally spaced
- `y` - The dependent variable vector
  - Must be the same length as x

### Outputs

- `I` - The approximate value of the integral



#### A Comment on Equal Spacing

Sometimes equal spacing is not 100% equal due to small errors in the data. I noticed this when working with the `linspace()` function where I was getting very small differences in the spacing of my x values. To account for that error, I have developed this function so that it accepts any difference in spacing less than 1e-10. Any higher and the function will throw an error.

