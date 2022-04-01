import numpy as np
import pyradi.ryplanck as ryplanck
import scipy.constants as const



def dstarFromRad(wl,Le,eta,Tsun=5900,tausun=0.5):
    """get Dstar cm.rt(Hz)/W, for wl in um, Le in W/(m2.sr)
    """
    dst = wl * 1e-6/(np.sqrt(2) * const.h * const.c )
    me = ryplanck.planck([wl], Tsun, type='el')
    mq = ryplanck.planck([wl], Tsun, type='ql')
    dst *= np.sqrt(eta*me / (Le*mq))
    dst *= 100
    k = Le / (tausun*me/np.pi)
    rho = k/2.17e-5
    return dst,k,rho

wl = 1.064
Les = [0.22,8, 10, 60 , 100]
eta = 0.8

for Le in Les:
    dst, k, rho = dstarFromRad(wl,Le,eta)
    print(f'Le={Le:6.2f} D*={dst:3e} rho={rho:.3f}' )

# print('Source radiance')

# #sun
# wl = 1.064
# dlam = 0.02
# Tsun = 6000
# Lsun = dlam * ryplanck.planck(wl, Tsun, type='el')  / np.pi
# print(f'Sun    : {Lsun:.2e} W/(m2.sr), {Tsun:.0f} K temp, {dlam:.2f} um filter, {wl:.3f} um')

# def L(pow, dia,div):
#     return pow / (np.pi**2 * (dia/2)**2 * div**2)

# #laser pointer
# p = 1e-3
# dia = 0.001
# div = 0.0015
# Lpt = L(p,dia,div)
# print(f'Pointer: {Lpt:.2e} W/(m2.sr), {p:.2e} watt, {dia:.4f} m dia, {div:.4f} rad div')

# #laser YAG
# p = 0.05 / 12e-9
# dia = 0.002
# div = 0.0002
# Lpt = L(p,dia,div)
# print(f'Nd:YAG : {Lpt:.2e} W/(m2.sr), {p:.2e} watt, {dia:.4f} m dia, {div:.4f} rad div')

# # Sun    : 2.05e+05 W/(m2.sr) for 6000 K temp, 0.02 um filter, 1.064 um
# # Pointer: 1.80e+08 W/(m2.sr) for 1.00e-03 watt, 0.0010 m dia, 0.0015 rad div
# # Nd:YAG : 1.06e+19 W/(m2.sr) for 4.17e+06 watt, 0.0020 m dia, 0.0002 rad div