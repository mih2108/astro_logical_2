class AstrodatasController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :create]

  def show
    # Date Information
      year = Time.now.year
      month = Time.now.month  
      day = Time.now.day
      hour = Time.now.hour
      tm = Date.today +1
      year_tm = tm.year
      month_tm = tm.month
      day_tm = tm.day
      hour_tm = 0

    # Geographic Location
      longitude = -73.985428
      latitidue = 40.748817
      altitude = 13


    # Get the Julian day number
    jd = Swe4r::swe_julday(year, month, day, hour)
    Swe4r::swe_set_topo(longitude, latitidue, altitude)

    jd_tm = Swe4r::swe_julday(year_tm, month_tm, day_tm, hour_tm)
    Swe4r::swe_set_topo(longitude, latitidue, altitude)

  # Set the sidereal mode for sidereal positions
    Swe4r::swe_set_sid_mode(Swe4r::SE_SIDM_LAHIRI, 0, 0)

    # Get the ayanamsha (the distance of the tropical vernal point from the sidereal zero point of the zodiac)
    ayanamsha = Swe4r::swe_get_ayanamsa_ut(jd)
    ayanamsha_tm = Swe4r::swe_get_ayanamsa_ut(jd_tm)
    # Get the longitude and latitude of various planets
    @sun_body = Swe4r::swe_calc_ut(jd, Swe4r::SE_SUN, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @moon_body = Swe4r::swe_calc_ut(jd, Swe4r::SE_MOON, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @mercury_body = Swe4r::swe_calc_ut(jd, Swe4r::SE_MERCURY, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @venus_body = Swe4r::swe_calc_ut(jd, Swe4r::SE_VENUS, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @mars_body = Swe4r::swe_calc_ut(jd, Swe4r::SE_MARS, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @jupiter_body = Swe4r::swe_calc_ut(jd, Swe4r::SE_JUPITER, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @saturn_body = Swe4r::swe_calc_ut(jd, Swe4r::SE_SATURN, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @uranus_body = Swe4r::swe_calc_ut(jd, Swe4r::SE_URANUS, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @neptune_body = Swe4r::swe_calc_ut(jd, Swe4r::SE_NEPTUNE, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @pluto_body = Swe4r::swe_calc_ut(jd, Swe4r::SE_PLUTO, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)

    @sun_body_tm = Swe4r::swe_calc_ut(jd_tm, Swe4r::SE_SUN, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @moon_body_tm = Swe4r::swe_calc_ut(jd_tm, Swe4r::SE_MOON, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @mercury_body_tm = Swe4r::swe_calc_ut(jd_tm, Swe4r::SE_MERCURY, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @venus_body_tm = Swe4r::swe_calc_ut(jd_tm, Swe4r::SE_VENUS, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @mars_body_tm = Swe4r::swe_calc_ut(jd_tm, Swe4r::SE_MARS, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @jupiter_body_tm = Swe4r::swe_calc_ut(jd_tm, Swe4r::SE_JUPITER, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @saturn_body_tm = Swe4r::swe_calc_ut(jd_tm, Swe4r::SE_SATURN, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @uranus_body_tm = Swe4r::swe_calc_ut(jd_tm, Swe4r::SE_URANUS, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @neptune_body_tm = Swe4r::swe_calc_ut(jd_tm, Swe4r::SE_NEPTUNE, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)
    @pluto_body_tm = Swe4r::swe_calc_ut(jd_tm, Swe4r::SE_PLUTO, Swe4r::SEFLG_MOSEPH|Swe4r::SEFLG_SPEED|Swe4r::SEFLG_TOPOCTR|Swe4r::SEFLG_SIDEREAL)


      def calculate(l)
        if (l>0 ==true) & (l<30==true)
          return "Taurus"
        elsif (l>30 ==true) & (l<60==true)
          return "Gemini"
        elsif (l>60 ==true) & (l<90==true)
          return "Cancer"
        elsif (l>90 ==true) & (l<120==true)
          return "Leo"
        elsif (l>120 ==true) & (l<150==true)
          return "Virgo"
        elsif (l>150 ==true) & (l<180==true)
          return "Libra"
        elsif (l>180 ==true) & (l<210==true)
          return "Scorpio"
        elsif (l>210 ==true) & (l<240==true)
          return "Sagittarius"
        elsif (l>240 ==true) & (l<270==true)
          return "Capricorn"
        elsif (l>270 ==true) & (l<300==true)
          return "Aquarius"
        elsif (l>300 ==true) & (l<330==true)
          return "Pisces"
        elsif (l>330.00==true) & (l<360 ==true)
          return "Aries"
        else
          return "Error"
        end
      end
  @sun_position=calculate(@sun_body[0])
  @moon_position=calculate(@moon_body[0])
  @mercury_position=calculate(@mercury_body[0])
  @venus_position=calculate(@venus_body[0])
  @mars_position=calculate(@mars_body[0])
  @jupiter_position=calculate(@jupiter_body[0])
  @saturn_position=calculate(@saturn_body[0])
  @uranus_position=calculate(@uranus_body[0])
  @neptune_position=calculate(@neptune_body[0])
  @pluto_position=calculate(@pluto_body[0])

  @sun_position_tm=calculate(@sun_body_tm[0])
  @moon_position_tm=calculate(@moon_body_tm[0])
  @mercury_position_tm=calculate(@mercury_body_tm[0])
  @venus_position_tm=calculate(@venus_body_tm[0])
  @mars_position_tm=calculate(@mars_body_tm[0])
  @jupiter_position_tm=calculate(@jupiter_body_tm[0])
  @saturn_position_tm=calculate(@saturn_body_tm[0])
  @uranus_position_tm=calculate(@uranus_body_tm[0])
  @neptune_position_tm=calculate(@neptune_body_tm[0])
  @pluto_position_tm=calculate(@pluto_body_tm[0])
end

end
  

  #Calculate the sign of the Sun using longitude conditionals


