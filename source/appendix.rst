==========
Appendices
==========

-------------------------------
List of Parameters in .rea File
-------------------------------

..........
Parameters
..........

This section tells nek5000

- If the input file reflects a 2D or 3D job (it should match the ``ldim`` parameter in the SIZE file).
- The combination of heat transfer, Stokes, Navier-Stokes, steady or unsteady to be run.
- The relevant physical parameters.
- The solution algorithm within nek5000 to use.
- The timestep size or Courant number to use, or whether to run variable DT (:math:`dt`), etc.

A .rea file starts with the following three parameters:

**NEKTON VERSION** the version of nek5000

**DIMENSIONAL RUN** number of spatial dimensions (NDIM=2,3 - has to match the setting in the SIZE file).

**PARAMETERS FOLLOW** the number of parameters which are going to be followed in the .rea file.(NPARAM)

The latter specifies how many lines of .rea file, starting from the next line, are the parameters and have to be read by the program.

-------------------------------
List of Parameters in SIZE File
-------------------------------

.. raw:: html

    <style> .red {color:red} </style>

.. role:: red

**P001  DENSITY** density for the case of constant properties (for variable density see parameter ``P030``).

**P002  VISCOS**  kinematic viscosity (if :math:`<0 \rightarrow Re`, otherwise :math:`1/Re`).

**P003  BETAG** if :math:`>0`, natural convection is turned on (Boussinesq approximation). :red:`NOT IN USE!`

**P004  GTHETA** model parameter for Boussinesq approximation (see parameter P003). :red:`NOT IN USE!`

**P005  PGRADX** :red:`NOT IN USE!`

**P006** :red:`NOT IN USE!`

**P007  RHOCP** navier5.f:      param(7) = param(1)  ! rhoCP   = rho :red:`NOT IN USE!`

**P008  CONDUCT** conductivity for the case of constant properties (if :math:`<0`, it defines the Peclet number, see parameter P030).
   connect2.f:      if(param(8) .lt.0.0) param(8)  = -1.0/param(8)

   navier5.f:      param(8) = param(2)  ! conduct = dyn. visc

**P009** :red:`NOT IN USE!` (passed to CPFLD(2,3)!)
   connect2.f:      CPFLD(2,3)=PARAM(9)

**P010  FINTIME** if :math:`>0`, specifies simulation end time. Otherwise, use NSTEP (P011).
   drive2.f:      FINTIM = PARAM(10)

**P011  NSTEP** number of time steps.
   connect2.f:            param(11) = 1.0

   drive2.f:      NSTEPS = PARAM(11)

**P012  DT** upper bound on time step :math:`dt`   (if :math:`<0`, then :math:`dt=|P012|` constant)
   connect2.f:            param(12) = 1.0

   drive2.f:      DT     = abs(PARAM(12))

**P013  IOCOMM** frequency of iteration histories
   drive2.f:      IOCOMM = PARAM(13)

**P014  IOTIME** if :math:`>0`, time interval to dump the fld file. Otherwise, use IOSTEP (P015).
   drive2.f:      TIMEIO = PARAM(14)

**P015  IOSTEP** dump frequency, number of time steps between dumps.
   drive2.f:      IOSTEP = PARAM(15)

   navier5.f:      if  (iastep.eq.0) iastep=param(15)   ! same as iostep

**P016  PSSOLVER** heat/passive scalar solver:

   1. Helmholz
   2. CVODE
   3. CVODE with user-supplied Jacobian
        
   Note: a negative number will set source terms to 0.

**P017  AXIS**  :red:`NOT IN USE!`

**P018  GRID** :red:`NOT IN USE!`

**P019  INTYPE** :red:`NOT IN USE!`
   connect2.f:            param(19) = 0.0

**P020  NORDER**  :red:`NOT IN USE!`

**P021  DIVERGENCE** tolerance for the pressure solver.
   drive2.f:      TOLPDF = abs(PARAM(21))

   hmholtz.f:      if (name.eq.'PRES'.and.param(21).ne.0) tol=abs(param(21))

**P022  HELMHOLTZ** tolerance for the velocity solver.
   drive2.f:      TOLHDF = abs(PARAM(22))

   hmholtz.f:      if (param(22).ne.0) tol=abs(param(22))

   hmholtz.f:         if (param(22).lt.0) tol=abs(param(22))*rbn0

   navier4.f:      if (param(22).ne.0) tol = abs(param(22))

**P023  NPSCAL** number of passive scalars.
   connect2.f:      NPSCAL=INT(PARAM(23))

**P024  TOLREL** relative tolerance for the passive scalar solver (CVODE).
   drive2.f:      TOLREL = abs(PARAM(24))

**P025  TOLABS** absolute tolerance for the passive scalar solver (CVODE).
   drive2.f:      TOLABS = abs(PARAM(25))

**P026  COURANT** maximum Courant number (number of RK4 substeps if OIFS is used).
   drive2.f:      CTARG  = PARAM(26)

**P027  TORDER** temporal discretization order (2 or 3).
   drive2.f:      NBDINP = PARAM(27)

**P028  NABMSH** Order of temporal integration for mesh velocity. If 1, 2, or 3 use Adams-Bashforth of corresponding order. Otherwise, extrapolation of order TORDER (P027).

**P029  MHD_VISCOS** if :math:`>0 \rightarrow` magnetic viscosity, if :math:`<0 \rightarrow` magnetic Reynolds number.
   connect2.f:      if(param(29).lt.0.0) param(29) = -1.0/param(29)

   connect2.f:      if (param(29).ne.0.) ifmhd  = .true.

   connect2.f:         cpfld(ifldmhd,1) = param(29)  ! magnetic viscosity

**P030  USERVP** if

   0. constant properties
   1. user-defined properties via USERVP subroutine (each scalar separately)
   2. user-defined properties via USERVP subroutine (all scalars at once)

**P031  NPERT**  if :math:`\neq 0`, number of perturbation modes in linearized N-S.
   connect2.f:      if (param(31).ne.0.) ifpert = .true.

   connect2.f:      if (param(31).lt.0.) ifbase = .false.   ! don't time adv base flow

   connect2.f:      npert = abs(param(31))

**P032  NBCRE2** if :math:`>0`, number of BCs in .re2 file, 0: all.
   connect2.f:      if (param(32).gt.0) nfldt = ibc + param(32)-1

**P033** :red:`NOT IN USE!`

**P034** :red:`NOT IN USE!`

**P035** :red:`NOT IN USE!`

**P036 XMAGNET** :red:`NOT IN USE!`

**P037 NGRIDES** :red:`NOT IN USE!`

**P038 NORDER2** :red:`NOT IN USE!`

**P039 NORDER3** :red:`NOT IN USE!`

**P040** :red:`NOT IN USE!`

**P041** 1 :math:`\rightarrow` multiplicative SEMG
   hsmg.f:c     if (param(41).eq.1) ifhybrid = .true. :math:`\leftarrow` :red:`NOT IN USE!`

**P042** linear solver for the pressure equation, 0 :math:`\rightarrow` GMRES or 1 :math:`\rightarrow` PCG

**P043** 0: additive multilevel scheme - 1: original two level scheme.
   navier6.f:      if (lx1.eq.2) param(43)=1.

   navier6.f:            if (param(43).eq.0) call hsmg_setup

**P044** 0=E-based additive Schwarz for PnPn-2; 1=A-based.

**P045** Free-surface stability control (defaults to 1.0)
   subs1.f:      FACTOR = PARAM(45)

**P046** if :math:`>0`, do not set Initial Condition (no call to subroutine SETICS).
   drive2.f:      irst = param(46)

   ic.f:      irst = param(46)        ! for lee's restart (rarely used)

   subs1.f:      irst = param(46)

**P047** parameter for moving mesh (Poisson ratio for mesh elasticity solve (default 0.4)).
   mvmesh.f:      VNU    = param(47)

**P048** :red:`NOT IN USE!`

**P049** if :math:`<0`, mixing length factor :red:`NOT IN USE!`.
   drive2.f:c     IF (PARAM(49) .LE. 0.0) PARAM(49) = TLFAC

   turb.f:      TLFAC = PARAM(49)

**P050** :red:`NOT IN USE!`

**P051** :red:`NOT IN USE!`

**P052  HISTEP** if :math:`>1`, history points dump frequency (in number of steps).
   prepost.f:      if (param(52).ge.1) iohis=param(52)

**P053** :red:`NOT IN USE!`

**P054** direction of fixed mass flowrate (1: :math:`x`-, 2: :math:`y`-, 3: :math:`z`-direction). If 0: :math:`x`-direction.
   drive2.f:      if (param(54).ne.0) icvflow = abs(param(54))

   drive2.f:      if (param(54).lt.0) iavflow = 1 ! mean velocity

**P055** volumetric flow rate for periodic case;  if p54:math:`<0`, then p55:=mean velocity.
   drive2.f:      flowrate = param(55)

**P056** :red:`NOT IN USE!`

**P057** :red:`NOT IN USE!`

**P058** :red:`NOT IN USE!`

**P059** if :math:`\neq0`, deformed elements (only relevant for FDM). !=0 :math:`\rightarrow` full Jac. eval. for each el.

**P060** if :math:`\neq0`, initialize velocity to 1e-10 (for steady Stokes problem).

**P061** :red:`NOT IN USE!`

**P062** if :math:`>0`, swap bytes for output.

**P063  WDSIZO** real output wordsize (8: 8-byte reals, else 4-byte).
   prepost.f:      if (param(63).gt.0) wdsizo = 8         ! 64-bit .fld file

**P064** if :math:`=1`, restart perturbation solution
   pertsupport.f:      if(param(64).ne.1) then !fresh start, param(64) is restart flag

**P065** number of I/O nodes (if :math:`< 0` write in separate subdirectories).

**P066** Output format: (only postx uses .rea value; other nondefault should be set in usrdat) (if :math:`\geq 0` binary else ASCII).
   connect2.f:         param(66) = 6        ! binary is default

   connect2.f:         param(66) = 0        ! ASCII

**P067** read format (if :math:`\geq 0` binary else ASCII).

**P068** averaging frequency in avg_all (0: every timestep).

**P069** :red:`NOT IN USE!`

**P070** :red:`NOT IN USE!`

**P071** :red:`NOT IN USE!`

**P072** :red:`NOT IN USE!`

**P073** :red:`NOT IN USE!`

**P074** if :math:`> 0` print Helmholtz solver iterations.
   hmholtz.f:         if (nid.eq.0.and.ifprint.and.param(74).ne.0) ifprinthmh=.true.

**P075** :red:`NOT IN USE!`

**P076** :red:`NOT IN USE!`

**P077** :red:`NOT IN USE!`

**P078** :red:`NOT IN USE!`

**P079** :red:`NOT IN USE!`

**P080** :red:`NOT IN USE!`

**P081** :red:`NOT IN USE!`

**P082** coarse-grid dimension (2: linear). :math:`NOT IN USE`}

**P083** :red:`NOT IN USE!`

**P084** if :math:`<0`, force initial time step to this value.

**P085** set :math:`dt` in *setdt*.
   subs1.f:            dt=dtopf*param(85)

**P086** :red:`RESERVED!` if :math:`\neq0`, use skew-symmetric form, else convective form.
   drive2.f:      PARAM(86) = 0 ! No skew-symm. convection for now

   navier1.f:      if (param(86).ne.0.0) then  ! skew-symmetric form

**P087** :red:`NOT IN USE!`

**P088** :red:`NOT IN USE!`

**P089** :red:`RESERVED!`

**P090** :red:`NOT IN USE!`

**P091** :red:`NOT IN USE!`

**P092** :red:`NOT IN USE!`

**P093**  number of previous solutions to use for residual projection.
   (adjust MXPREF in SIZEu accordingly)

**P094** if :math:`>0`, start projecting velocity and passive scalars after P094 steps

**P095** if :math:`>0`, start projecting pressure after P095 steps

**P096** :red:`NOT IN USE!`

**P097** :red:`NOT IN USE!`

**P098** :red:`NOT IN USE!`

**P099** dealiasing:
   :math:`<0`:  disable
   
   3:  old dealiasing

   4:  new dealiasing

**P100** :red:`RESERVED!` pressure preconditioner when using CG solver (0: Jacobi, :math:`>0`: two-level Schwarz) :red:`or viseversa?`

**P101** number of additional modes to filter (0: only last mode)
   navier5.f:         ncut = param(101)+1

**P102** :red:`NOT IN USE!`

**P103** filter weight for last mode (:math:`<0`: disabled)

**P107** if :math:`\neq0`, add it to h2 in sethlm

**P116 NELX** number of elements in x for Fast Tensor Product FTP solver (0: do not use FTP).
   NOTE: box geometries, constant properties only!

**P117  NELY** number of elements in y for FTP

**P118  NELZ** number of elements in z for FTP

--------------------
The .fld File Format
--------------------
