
const rad = 1.0
const deg = pi/180


const c_light = 2.99792458e8        # * meter / second
const h_planck = 6.62606957e-34     # * joule * second
const hbar = h_planck / 2pi
const eplus = 1.602176487e-19       # * ampere * second

# ===================================
# natural units: everything is in eV. 

const electronvolt = 1.0
const meter = 1/electronvolt * (eplus / c_light / hbar)
# const second = c_light * meter

const au = 149_597_870_700 * meter
# const ly = 365.25 * 24 * 3600 * second
const parsec = 648000 / pi * au

# const barn = 1e-28 * meter * meter
# const femtobarn = 1e-15 * barn


const kiloelectronvolt = 1e3 * electronvolt
const megaelectronvolt = 1e6 * electronvolt
const gigaelectronvolt = 1e9 * electronvolt
const teraelectronvolt = 1e12 * electronvolt
const petaelectronvolt = 1e15 * electronvolt
const exaelectronvolt = 1e18 * electronvolt
const eV = electronvolt
const keV = kiloelectronvolt
const MeV = megaelectronvolt
const GeV = gigaelectronvolt
const TeV = teraelectronvolt
const PeV = petaelectronvolt
const EeV = exaelectronvolt

const kilometer = 1000 * meter
const centimeter = 0.01 * meter
const km = kilometer
const cm = centimeter

# const nanosecond = 1e-9 * second
# const microsecond = 1e-6 * second
# const millisecond = 1e-3 * second
# const minute = 60 * second
# const hour = 3600 * second
# const ns = nanosecond
# const mus = microsecond
# const ms = millisecond
# const sec = second

const kiloparsec = 1e3 * parsec
const megaparsec = 1e6 * parsec
const gigaparsec = 1e9 * parsec
const pc = parsec
const kpc = kiloparsec
const Mpc = megaparsec
const Gpc = gigaparsec

kpc/cm