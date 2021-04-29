# False Position Algorithm

False Position is a root finding algorithm that find the root of a function using two guess that bracket the root.

### Inputs

- `func` - The function being evaluated
- `xl` - The lower bracket/guess
- `xu` - The upper bracket/guess
- `es` - Stopping criteria
  - Default set to 0.0001%
- `maxit` - Maximum number of iterations
  - Default set to 200
- `varargin` - Any additional parameters
  - Not used in this function

### Outputs

- `root` - The approximate value of the root
- `fx` - The function evaluated at that root
- `ea` - Approximate relative error (%)
- `iter` - Number of iterations the algorithm took

