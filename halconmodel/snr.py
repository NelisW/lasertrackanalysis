import math


## Laser Rangefinder Range Equation

# In our equation the transmitter & receiver are not on the same optical path
# Objective: is to derive an expression for the SNR for the laser rangefinder


## 1. Noise Equivalent Irradiance

    
    # Calculate the noise bandwidth at the receiver (if its given you can skip this step)
        # Df is the noise bandwidth at the receiver (Hz)
        # kn is the ratio of noise equivalent bandwidth to -3 dB bandwidth
        # kf is the Time-bandwidth product with units 
        # tp is the pulse width (s)

def noisebwR(kn,kf,tp):
    
    Df =  (kn*kf) / tp
    return Df

    
    # Calculate the receiver filter atmospheric transmittance
        # tauA (τa) is atmospheric transmittance designator to targer
        # SigmaW (σW) is sea level atmospheric attenuation coefficient
        # AlphaHT (αHT) is fractional decrease in atmospheric attenuation coefficient as a function of height of laser target designator above sea level
        # RT is  designator to target distance (km)   

        
def tauA(SigmaW, AlphaHT, RT):        
        
    tauA = math.exp( (-SigmaW*(AlphaHT*RT)) )    
    return tauA
        
               
        # tauB (τb) is atmospheric transmittance at the reciever
        # AlphaHR (αHR) is fractional decrease in atmospheric attenuation coefficient as a function of height of receiver above sea level
        # RR is Target‐to‐receiver distance (km) 
        
        
def tauB(SigmaW, AlphaHR, RR):        
        
    tauB = math.exp( (-SigmaW*( AlphaHR*RR )) )    
    return tauB
        
        # tauAB (τab) is atmospheric transmittance target to reciever
        
             
def tauAB(SigmaW, AlphaHT, RT, AlphaHR, RR):        
        
    tauAB = math.exp( (-SigmaW*(AlphaHT*RT + AlphaHR*RR)) )    
    return tauAB

    
    # Calculate the detector noise
        # NEP is Noise for particular device (W)
        # R is detector spectral responsivity (A/W)
        # Id is detector noise current density (A/ sqrt(Hz))

def NEP(R, Id):
    
    NEP = R / Id
    return NEP


        # Dn (D*) is the detector noise (cm* sqrt(Hz) /W])
        # Ad is the detector area (m)

def Dn(Df, Ad, NEP):
    
    Dn = (sqrt(Df * Ad) / NEP)
    return Dn
 
    
    # a. Calculating the noise equivalent irradiance at the receiver
        # Ar is the reciever aperture area (m)

def NEE(Df, Ad, Dn, Ar, tauA):
    
    NEE = math.sqrt(Df * Ad) / (Dn * Ar * tauA)
    
    return NEE
    
    
  ## 2. Signal Irradiance



    # Calculating the Laser beam spot diameter and area at the target location
        # DT is the transmitted beam diameter (m)
        # thataB (θB) is the transmitted beam width full angle (radiance)


def LBSD(DT, RT, thetaB):
        
        LBD = DT + (RT * thetaB)
        return LBD
    
    
def LBArea(DT, RT, thetaB):
    
        LBD = DT + (RT * thetaB)
        LBA = (math.pi*(math.pow(LBD, 2)))/4
        return LBA
    
    

    # a. Calculating the Power density at target location without considering the effect of atmospheric attenuation     
        # PT is the peak transmitted power from the laser target designator (W)
        # Ql is the pulse energy (J)
        # tp is is the pulse width in (s)
    
    
    # If you have the energy you can use this
    
def powercon(Ql,tp):
        
        PT = Ql / tp
        return PT
    
    # Else, start here
    
def PDTarget(PT, DT, RT, thetaB):
        
        LBD = DT + (RT * thetaB)
        LBA = (math.pi*(math.pow(LBD, 2)))/4
        PDT = PT / LBA
        return PDT
    
def PDTarget1(PT, LBD):
        
        LBA = (math.pi*(math.pow(LBD, 2)))/4
        PDT = PT / LBA
        return PDT
        
        
def PDTarget2(PT, LBA):
        
        PDT = PT / LBA
        return PDT


    # b. Calculating the Power density at target location with considering the effect of atmospheric attenuation
        # PDA is the power density at the target location

def PDTargetA(PDT, tauA):
    
    PDA = PDT* tauA
    return PDA

    
    
    # c. Calculating the Power density at the target surface (target irradiance)  
        # PDS is the power density at target surface
        # ThetaT (θT) is Angle between transmitter line‐of‐sight and normal to the target
        
def PDTargetS(PDA, thetaT):

    PDS = PDA * math.cos(thetaT)
    return PDS


## 3. Lambertian Target Reflectance
    
    
    # a. Laser power density reflected from the target
        # RPD is the Laser power density reflected from the target
        # p (ρ) is the Target reflectivity 


def RPDTarget(PDS, p):
    
    RPD = PDS * p
    return RPD

    
    # b. reflected power density per unit solid angle (target brightness)
        # TB is the reflected power density per unit solid angle
    
def TB(RPD):

    TB = RPD / math.pi
    return TB



    # c. Power density available at the receiver location 

    # We first have to calculate Solid angle subtended by receiving aperture on target
        # SA is the Solid angle subtended by receiving aperture on target
        
def SA(Ar, RR):
    
    SA = Ar / (math.pow(RR, 2))
    return SA
               
               
    # PDR is Power density available at the receiver location
    # ThetaR (θR) is the Angle between receiver line‐of‐sight and normal to the target
               

def PDReciever(SA, TB, AT, thetaR, tauB): 
    
    PDR = SA * TB * math.cos(thetaR) * tauB * AT
    return PDR
               
               
    
## 4. Lambertian Target against the sky

               
    # SNR is the Signal to noise ratio for the laser rangefinder
            
def SNR(PDR, NEE):
    
    SNR = PDR / NEE
    return SNR          