buf_size = 100000

// PID gain
Kp = 300.0
Ki = 10.0
Kd = 0.0
g = 300.0 // pseudo diff

// Digital control
// discretization = 'euler'
discretization = 'trapezoid'

Ts = 0.01

/// tf of 1/s
i_num = [0.0, Ts]
i_den = [1.0, -1.0]
if discretization == 'trapezoid' then
    i_num = [Ts, Ts]
    i_den = [2.0, -2.0]
end

/// tf of N * Kd / (s + N)
d_num = [1.0, -1.0]
d_den = [1.0, g*Ts-1.0]

if discretization == 'trapezoid' then
    d_num = [1.0, -1.0]
    d_den = [(1.0+g*Ts/2.0), g*Ts/2.0-1.0]
end

i_num_1 = i_num(1)
i_num_2 = i_num(2)
i_den_1 = i_den(1)
i_den_2 = i_den(2)

d_num_1 = d_num(1)
d_num_2 = d_num(2)
d_den_1 = d_den(1)
d_den_2 = d_den(2)
