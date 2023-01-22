def falling(n, k):
    """Compute the falling factorial of n to depth k.

    >>> falling(6, 3)  # 6 * 5 * 4
    120
    >>> falling(4, 3)  # 4 * 3 * 2
    24
    >>> falling(4, 1)  # 4
    4
    >>> falling(4, 0)
    1
    """
    # Iteratively
    product = 1
    while k:
        product *= n
        n, k = n - 1, k -1
    return product

    # Recursively
    if k == 0:
        return 1
    else:
        return n * falling(n-1, k-1)
    
    # Tail recursively
    def tail_falling(n, k, prod):
        if k == 0:
            return prod
        else:
            return tail_falling(n-1, k-1, prod*n)
    return tail_falling(n,k,1)



def sum_digits(y):
    """Sum all the digits of y.

    >>> sum_digits(10) # 1 + 0 = 1
    1
    >>> sum_digits(4224) # 4 + 2 + 2 + 4 = 12
    12
    >>> sum_digits(1234567890)
    45
    >>> a = sum_digits(123) # make sure that you are using return rather than print
    >>> a
    6
    """
    # Tail recursively
    def tail_sum_digits(y, total):
        if not y:
            return total
        else:
            return tail_sum_digits(y//10, total+y%10)
    return tail_sum_digits(y, 0)

    # Recursively
    if not y:
        return 0
    else:
        return y%10 + sum_digits(y//10)

    # Iteratively
    total = 0
    while y:
        total += y % 10
        y //= 10
    return total


def double_eights(n):
    """Return true if n has two eights in a row.
    >>> double_eights(8)
    False
    >>> double_eights(88)
    True
    >>> double_eights(2882)
    True
    >>> double_eights(880088)
    True
    >>> double_eights(12345)
    False
    >>> double_eights(80808080)
    False
    """
    # Recursively
    if not n:
        return False
    elif n%10 == 8 and (n//10)%10 == 8:
        return True
    else:
        return double_eights(n//10)
    
    # Iteratively
    while n:
        last = n%10
        nxt = (n//10)%10
        if last == 8 and nxt == last:
            return True
        n //= 10
    return False
