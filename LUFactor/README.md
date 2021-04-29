# L U Factorization

LU Factorization takes an nxn square matrix (`A`) and factors it into a lower(`L`) triangular matrix and an upper(`U`) triangular matrix. This function uses Gaussian Elimination for the factoring, and uses pivoting to prevent divide by zero errors and to reduce subtractive cancelation errors. The pivots are tracked by the permutation matrix (`P`). The factorization is done so that `L * U = P * A`.

### Inputs

- `A` - The coefficient matrix to a system of linear equations
  - Must be a square nxn matrix

### Outputs

- `L` - The lower triangular matrix
- `U` - The upper triangular matrix
- `P` - The Permutation matrix