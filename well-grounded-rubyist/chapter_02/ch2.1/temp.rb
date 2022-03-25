#!/usr/bin/env ruby

class Temp
    def f2c(f)
        ((f - 32) * 5) / 9.0
    end

    def c2f(c)
        c * 9.0 / 5 + 32
    end
end
