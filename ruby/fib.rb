# return fibanocci sequence of all numbers less than or euqal to fibmax
def fib(fibmax)
    fibseq = [ 0, 1]
    fibnext = 1
    while fibnext <= fibmax
        fibseq.append(fibnext)
        fibnext = fibseq[-1] + fibseq[-2]
    end
    fibseq
end
