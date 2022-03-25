
import numpy
from scipy.interpolate import interp1d
from scipy.optimize import fsolve


##############################################################################
##
def _rangeEquationCalc(r,i,e,tauTable,n,rMax):
    if r > rMax:
        print('\n\n***** range estimate of {0} exceed the lookup table range of {1}\n\n'.format(r[0],rMax))
        return 0
    return i * tauTable(r) / (r ** n) - e

##############################################################################
##
def rangeEquation(Intensity, Irradiance, rangeTab, tauTab, rangeGuess = 1, n = 2):
    """ See http://pyradi.googlecode.com/svn//trunk/doc/_build/html/ryplot.html
    """

    tauTable = interp1d(rangeTab, tauTab, kind = 'linear')

    Range = fsolve(_rangeEquationCalc, rangeGuess,
        args = (Intensity,Irradiance,tauTable,n,numpy.max(rangeTab),))

    if(Range < rangeTab[2] ):
        print('\n\n***** range estimate of {0} might be invalid,'.format(Range[0])
            + ' increase lookup table resolution at close range\n\n')
        Range = - Range

    return Range

##############################################################################
##
#demonstrate the range equation solver
#create a range table and its associated transmittance table
rangeTab = numpy.linspace(0, 10000, 1000)
tauTab = numpy.exp(- 0.00015 * rangeTab)
Intensity=200
Irradiance=10e-6
r = rangeEquation(Intensity = Intensity, Irradiance = Irradiance, rangeTab = rangeTab,
      tauTab = tauTab, rangeGuess = 1, n = 2)
#test the solution by calculating the irradiance at this range.
tauTable = interp1d(rangeTab, tauTab, kind = 'linear')
irrad = Intensity * tauTable(r) / r ** 2

print('Range equation solver: at range {0} the irradiance is {1}, error is {2}'.format(
    r[0],irrad[0], (irrad[0] - Irradiance) / Irradiance ))


